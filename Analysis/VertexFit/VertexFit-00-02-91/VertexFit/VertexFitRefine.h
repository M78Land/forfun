/* <===<===<===<===<===<===<===<===<===~===>===>===>===>===>===>===>===>===>
 * File Name:    VertexFitRefine.h
 * Author:       Hao-Kai SUN
 * Created:      2021-09-07 Tue 23:47:01 CST
 * <<=====================================>>
 * Last Updated: 2021-10-28 Thu 12:12:24 CST
 *           By: Hao-Kai SUN <sunhk@ihep.ac.cn>
 *     Update #: 81
 * ============================== CODES ==============================>>> */
#ifndef VERTEXFIT_VERTEXFITREFINE_H
#define VERTEXFIT_VERTEXFITREFINE_H

#include "VertexFit/VertexExtrapolate.h"
#include "VertexFit/VertexFit.h"

namespace VTXPDGM {
extern const double& electron;
extern const double& muon;
extern const double& pion;
extern const double& kaon;
extern const double& proton;

extern const double empikp[5];
extern const double empikp2[5];
} // namespace VTXPDGM

class VertexFitRefine
{
    friend class VertexFit;

  public:
    static VertexFitRefine* instance();
    ~VertexFitRefine();

    // initialization, cleanup.
    void init();

    void AddTrack(const int index, RecMdcKalTrack* p,
                  const RecMdcKalTrack::PidType pid);

    // add methods
    void AddVertex(int number, VertexParameter vpar, std::vector<int> lis);
    void AddVertex(int number, VertexParameter vpar, int n1, int n2);
    void AddVertex(int number, VertexParameter vpar, int n1, int n2, int n3);
    void AddVertex(int number, VertexParameter vpar, int n1, int n2, int n3,
                   int n4);
    void AddVertex(int number, VertexParameter vpar, int n1, int n2, int n3,
                   int n4, int n5);
    void AddVertex(int number, VertexParameter vpar, int n1, int n2, int n3,
                   int n4, int n5, int n6);
    void AddVertex(int number, VertexParameter vpar, int n1, int n2, int n3,
                   int n4, int n5, int n6, int n7);
    void AddVertex(int number, VertexParameter vpar, int n1, int n2, int n3,
                   int n4, int n5, int n6, int n7, int n8);
    void AddVertex(int number, VertexParameter vpar, int n1, int n2, int n3,
                   int n4, int n5, int n6, int n7, int n8, int n9);
    void AddVertex(int number, VertexParameter vpar, int n1, int n2, int n3,
                   int n4, int n5, int n6, int n7, int n8, int n9, int n10);
    void AddVertex(int number, VertexParameter vpar, int n1, int n2, int n3,
                   int n4, int n5, int n6, int n7, int n8, int n9, int n10,
                   int n11);
    void AddVertex(int number, VertexParameter vpar, int n1, int n2, int n3,
                   int n4, int n5, int n6, int n7, int n8, int n9, int n10,
                   int n11, int n12);
    void AddBeamFit(int number, VertexParameter vpar, int n);

    // set iteration number and chisq cut
    void setIterNumber(const int niter = 10);
    void setChisqCut(const double chicut = 1000, const double chiter = 1.0e-3);
    void setMagCorrFactor(const double factor = 1.000);

    bool Fit();
    bool Fit(int n);

    // get
    double chisq() const;
    double chisq(int n) const;

    // updated WTrack parameter in vertex fit
    HepLorentzVector pfit(int n) const;
    HepPoint3D xfit(int n) const;
    HepVector w(int n) const;
    HepSymMatrix Ew(int n) const;
    WTrackParameter wtrk(int n) const;

    // updated Vertex Parameter in vertex fit
    HepPoint3D vx(int n) const;
    HepVector Vx(int n) const;
    HepSymMatrix Evx(int n) const;
    double errorVx(int n, int i) const;
    VertexParameter vpar(int n) const;

    // virtual particle from Vertex Fit
    WTrackParameter wVirtualTrack(int n) const;

    // debug
    int getPath() const;

  private:
    // Singleton
    VertexFitRefine();
    static VertexFitRefine* m_instance;

    VertexFit* vtxfit;
    VertexExtrapolate* vtxext;

    // static const double beampipe; // = 3.111;
    static const double obeampipe; // = 3.370 + 0.0130 * 3;
    // 6.3000 + 0.0130*3 cm inner mdc chamber wall
    // static const double innerwall;  // = 6.290 - 0.0130 * 3;
    // static const double oinnerwall; // = 6.425 + 0.0130 * 3;

    std::vector<int> m_trkIdxOrigin;
    std::vector<RecMdcKalTrack*> m_tracksOrigin;
    std::vector<RecMdcKalTrack::PidType> m_trkPidOrigin;
    std::vector<WTrackParameter> m_wtrkInfit;
    std::vector<HepLorentzVector> m_p4Infit;
    std::vector<HepPoint3D> m_x3Infit;

    // int m_vtxidx;
    std::vector<VertexParameter> m_vtxsOrigin;

    // debug
    int thePath;
};

// forward declarations, inline definitions
#include "VertexFit/VertexFitRefine.cc"

#endif /* VERTEXFIT_VERTEXFITREFINE_H */
/* ===================================================================<<< */
/* ==================== VertexFitRefine.h ends here ===================== */
