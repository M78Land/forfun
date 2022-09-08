/* <===<===<===<===<===<===<===<===<===~===>===>===>===>===>===>===>===>===>
 * File Name:    VertexFitRefine.cxx
 * Author:       Hao-Kai SUN
 * Created:      2021-09-08 Wed 00:15:40 CST
 * <<=====================================>>
 * Last Updated: 2021-10-28 Thu 13:08:19 CST
 *           By: Hao-Kai SUN <sunhk@ihep.ac.cn>
 *     Update #: 134
 * ============================== CODES ==============================>>> */
#include "VertexFit/VertexFitRefine.h"

namespace VTXPDGM {
const double& electron = 0.0005109989461;
const double& muon     = 0.1056583745;
const double& pion     = 0.13957039;
const double& kaon     = 0.493677;
const double& proton   = 0.938272081;

const double empikp[5]  = {electron, muon, pion, kaon, proton};
const double empikp2[5] = {electron * electron, muon* muon, pion* pion,
                           kaon* kaon, proton* proton};
} // namespace VTXPDGM

VertexFitRefine* VertexFitRefine::m_instance = nullptr;

// const double VertexFitRefine::beampipe  = 3.111;
const double VertexFitRefine::obeampipe = 3.370; // + 0.0130 * 1;
// 6.3000 + 0.0130*3 cm inner mdc chamber wall
// const double VertexFitRefine::innerwall  = 6.290 - 0.0130 * 1;
// const double VertexFitRefine::oinnerwall = 6.425 + 0.0130 * 1;

VertexFitRefine::VertexFitRefine() {}

VertexFitRefine* VertexFitRefine::instance()
{
    if (m_instance == nullptr) m_instance = new VertexFitRefine();
    return m_instance;
}

void VertexFitRefine::init()
{
    m_trkIdxOrigin.clear();
    m_tracksOrigin.clear();
    m_trkPidOrigin.clear();
    m_wtrkInfit.clear();
    m_p4Infit.clear();
    m_x3Infit.clear();
    vtxfit = VertexFit::instance();
    vtxfit->init();
    vtxext = VertexExtrapolate::instance();
    m_vtxsOrigin.clear();
    thePath = 0;
}

VertexFitRefine::~VertexFitRefine()
{
    vtxfit->init();
}

void VertexFitRefine::AddTrack(const int index, RecMdcKalTrack* p,
                               const RecMdcKalTrack::PidType pid)
{
    m_trkIdxOrigin.push_back(index);
    m_tracksOrigin.push_back(p);
    m_trkPidOrigin.push_back(pid);
    if (index != m_trkIdxOrigin.size() - 1) {
        std::cerr << "TrackPool: wrong track index " << index << ", "
                  << m_trkIdxOrigin.size() << std::endl;
    }

    int idx = m_trkIdxOrigin.size() - 1;
    m_tracksOrigin[idx]->setPidType(m_trkPidOrigin[idx]);
    m_wtrkInfit.push_back(WTrackParameter(VTXPDGM::empikp[m_trkPidOrigin[idx]],
                                          m_tracksOrigin[idx]->helix(),
                                          m_tracksOrigin[idx]->err()));
    vtxfit->AddTrack(m_trkIdxOrigin[idx], m_wtrkInfit[idx]);
}

bool VertexFitRefine::Fit()
{
    HepPoint3D vx(0.0, 0.0, 0.0);

    for (int i = 0; i != m_trkIdxOrigin.size(); ++i) {
        m_p4Infit.push_back(m_wtrkInfit[i].p());
        m_x3Infit.push_back(m_wtrkInfit[i].x());
    }

    //// setup the initial vertex
    HepPoint3D vWideVertex(0., 0., 0.);

    HepSymMatrix evWideVertex(3, 0);
    evWideVertex[0][0] = 1.0E12;
    evWideVertex[1][1] = 1.0E12;
    evWideVertex[2][2] = 1.0E12;

    VertexParameter wideVertex;
    wideVertex.setVx(vWideVertex);
    wideVertex.setEvx(evWideVertex);

    if (vtxfit->m_vpar_infit.size() == 0) {
        std::cerr << "Not set Vertex?" << std::endl;
        return false;
    }
    double ZChi2      = 9999.9;
    HepPoint3D ZDP    = vtxfit->vx(0);
    HepPoint3D ZDPE   = HepPoint3D(9999.9, 9999.9, 9999.9);
    bool ZFit         = false;
    HepVector ZVx     = vtxfit->Vx(0);
    HepSymMatrix ZEVx = evWideVertex;

    //// do the fit
    if (vtxfit->Fit(0)) {
        vtxfit->Swim(0);
        vtxfit->BuildVirtualParticle(0);

        ZChi2 = vtxfit->chisq(0);

        for (int i = 0; i != m_trkIdxOrigin.size(); ++i) {
            m_p4Infit[i] = vtxfit->pfit(i);
            m_x3Infit[i] = vtxfit->xfit(i);
        }

        ZDP  = vtxfit->vx(0);
        ZVx  = vtxfit->Vx(0);
        ZEVx = vtxfit->Evx(0);
        ZDPE.set(vtxfit->errorVx(0, 0), vtxfit->errorVx(0, 1),
                 vtxfit->errorVx(0, 2));
        ZFit = true;
    }

    if (ZFit) {
        if (ZDP.perp() > obeampipe) {
            //// initialize the fitter
            vtxfit->init();

            for (int i = 0; i != m_trkIdxOrigin.size(); ++i) {
                m_tracksOrigin[i]->setPidType(m_trkPidOrigin[i]);
                m_wtrkInfit[i] = WTrackParameter(
                    VTXPDGM::empikp[m_trkPidOrigin[i]],
                    m_tracksOrigin[i]->fhelix(), m_tracksOrigin[i]->ferr());
                vtxfit->AddTrack(i, m_wtrkInfit[i]);
            }

            wideVertex.setVx(ZVx);
            // wideVertex.setEvx(ZEVx * 25.0); // 5 * sigma square, not good
            wideVertex.setEvx(evWideVertex);

            //// add the daughters
            vtxfit->AddVertex(0, wideVertex, 0, 1);
            //// do the fit
            if (vtxfit->Fit(0)) {
                vtxfit->Swim(0);
                vtxfit->BuildVirtualParticle(0);
                vx      = vtxfit->vx(0);
                ZVx     = vtxfit->Vx(0);
                ZEVx    = vtxfit->Evx(0);
                thePath = 3;
            } else {
                vx      = ZDP;
                thePath = 2;
            }
        } else {
            vx      = ZDP;
            thePath = 1;
        }
    } else { // initial ZFit failed.
        //// initialize the fitter
        vtxfit->init();

        for (int i = 0; i != m_trkIdxOrigin.size(); ++i) {
            m_tracksOrigin[i]->setPidType(m_trkPidOrigin[i]);
            m_wtrkInfit[i] = WTrackParameter(VTXPDGM::empikp[m_trkPidOrigin[i]],
                                             m_tracksOrigin[i]->fhelix(),
                                             m_tracksOrigin[i]->ferr());
            vtxfit->AddTrack(i, m_wtrkInfit[i]);
        }

        if (vtxfit->Fit(0)) {
            vtxfit->Swim(0);
            vtxfit->BuildVirtualParticle(0);
            vx      = vtxfit->vx(0);
            ZVx     = vtxfit->Vx(0);
            ZEVx    = vtxfit->Evx(0);
            thePath = 4;
        } else {
            thePath = 5;
            return false;
        }
    }
    //// initialize the fitter
    vtxfit->init();

    for (int i = 0; i != m_trkIdxOrigin.size(); ++i) {
        m_tracksOrigin[i]->setPidType(m_trkPidOrigin[i]);
        vtxext->KalFitExt(vx, m_tracksOrigin[i], m_trkPidOrigin[i]);
        m_wtrkInfit[i] =
            WTrackParameter(VTXPDGM::empikp[m_trkPidOrigin[i]],
                            vtxext->getHelixVector(), vtxext->getErrorMatrix());
        m_p4Infit[i] = m_wtrkInfit[i].p();
        m_x3Infit[i] = m_wtrkInfit[i].x();

        vtxfit->AddTrack(i, m_wtrkInfit[i]);
    }

    wideVertex.setVx(vx);
    // wideVertex.setEvx(ZEVx * 25.0); // 5 * sigma square, not good, why?
    wideVertex.setEvx(evWideVertex);
    //// add the daughters
    vtxfit->AddVertex(0, wideVertex, 0, 1);

    //// do the fit
    if (vtxfit->Fit(0)) {
        vtxfit->Swim(0);
        vtxfit->BuildVirtualParticle(0);
    } else {
        thePath = 6;
    }

    return true;
}

/* ===================================================================<<< */
/* =================== VertexFitRefine.cxx ends here ==================== */
