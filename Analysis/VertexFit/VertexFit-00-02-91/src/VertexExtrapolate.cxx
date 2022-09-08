/* <===<===<===<===<===<===<===<===<===~===>===>===>===>===>===>===>===>===>
 * File Name:    VertexExtrapolate.cxx
 * Author:       Hao-Kai SUN
 * Created:      2021-09-06 Mon 18:05:16 CST
 * <<=====================================>>
 * Last Updated: 2021-10-18 Mon 21:03:22 CST
 *           By: Hao-Kai SUN <sunhk@ihep.ac.cn>
 *     Update #: 204
 * ============================== CODES ==============================>>> */
#include "VertexFit/VertexExtrapolate.h"

#include "G4Geo/BesG4Geo.h"
#include "G4Geo/MdcG4Geo.h"
#include "KalFitAlg/KalFitTrack.h"

#include "GaudiKernel/Bootstrap.h"
#include "GaudiKernel/ISvcLocator.h"

#include "MagneticField/IMagneticFieldSvc.h"

static const char* matNames[9] = {"MDCGas",
                                  "LogicalMdcInnerFilm1",
                                  "logicalMdcSegment2",
                                  "LogicalMdcInnerFilm1",
                                  "logicalWorld",
                                  "logicalouterBe",
                                  "logicaloilLayer",
                                  "logicalinnerBe",
                                  "logicalgoldLayer"};

VertexExtrapolate* VertexExtrapolate::m_instance = nullptr;

VertexExtrapolate* VertexExtrapolate::instance()
{
    if (m_instance == nullptr) m_instance = new VertexExtrapolate();
    return m_instance;
}

VertexExtrapolate::VertexExtrapolate()
{
    m_BesKalmanExtMaterials.clear();
    m_BesKalmanExtWalls.clear();

    constructWallsFromGdml();

    m_helixVector = CLHEP::Hep3Vector(5, 0);
    m_errorMatrix = CLHEP::HepSymMatrix(5, 0);

    ISvcLocator* svcLocator = Gaudi::svcLocator();

    IMagneticFieldSvc* IMFSvc = nullptr;

    StatusCode sc = svcLocator->service("MagneticFieldSvc", IMFSvc);
    if (sc.isFailure()) {
        std::cerr << MSG::ERROR << "Unable to open Magnetic field service"
                  << std::endl;
    }
    KalFitTrack::numf_ = 21; // ???
    KalFitElement::muls(1);
    KalFitElement::loss(1);
    KalFitTrack::setMagneticFieldSvc(IMFSvc);
    KalFitTrack::Bznom_ = -10.; // ???
}

void VertexExtrapolate::G4MtovKalFitM(G4Material* g4m, const std::string& name)
{
    double Z = 0.0;
    double A = 0.0;
    for (int i = 0; i != g4m->GetElementVector()->size(); ++i) {
        Z += (g4m->GetElement(i)->GetZ()) * (g4m->GetFractionVector()[i]);
        A += (g4m->GetElement(i)->GetA()) * (g4m->GetFractionVector()[i]);
    }
    double Ionization = g4m->GetIonisation()->GetMeanExcitationEnergy();
    double Density    = g4m->GetDensity() / (g / cm3);
    double Radlen     = g4m->GetRadlen();
    std::cout << " " << name << ": Z:  " << Z << " A: " << (A / (g / mole))
              << " Ionization: " << (Ionization / eV) << " Density: " << Density
              << " Radlen:     " << Radlen << std::endl;
    KalFitMaterial FitMdcMaterial(Z, A / g / mole, Ionization / eV, Density,
                                  Radlen / 10.);
    m_BesKalmanExtMaterials.push_back(FitMdcMaterial);
}

void VertexExtrapolate::AddWalls(int index, double radius, double thick,
                                 double length, double z0)
{
    std::cout << " " << matNames[index] << ": radius: " << radius
              << ",  thick: " << thick << ",  length: " << length << std::endl;

    KalFitMaterial& tmp = m_BesKalmanExtMaterials[index];
    KalFitCylinder innerwallCylinder(&tmp, radius, thick, length, z0);
    m_BesKalmanExtWalls.push_back(innerwallCylinder);
}

void VertexExtrapolate::AddWalls(int index)
{
    G4Tubs* g4t   = getTubs(matNames[index]);
    double radius = g4t->GetInnerRadius() / (cm);
    double thick  = g4t->GetOuterRadius() / (cm)-g4t->GetInnerRadius() / (cm);
    double length = 2.0 * g4t->GetZHalfLength() / (cm);
    double z0     = 0.0;

    AddWalls(index, radius, thick, length, z0);
}

void VertexExtrapolate::testMW(int index)
{
    KalFitMaterial m = m_BesKalmanExtMaterials[index];
    KalFitCylinder w = m_BesKalmanExtWalls[index];
    std::cout << index << " ==========================" << std::endl;
    std::cout << "TEST==Radlen:  " << m.X0() << std::endl;
    std::cout << "TEST==Radlen:  " << w.material().X0()
              << "      radius: " << w.radius() << std::endl;
}

void VertexExtrapolate::constructWallsFromGdml(void)
{
    /// mdcgas
    G4LogicalVolume* logicalMdc = 0;
    MdcG4Geo* aMdcG4Geo         = new MdcG4Geo();
    logicalMdc                  = aMdcG4Geo->GetTopVolume();
    G4Material* mat             = logicalMdc->GetMaterial();
    KalFitTrack::mdcGasRadlen_  = mat->GetRadlen() / 10.;
    G4MtovKalFitM(mat, "MDCGas");

    G4LogicalVolume* logicalBes = 0;
    BesG4Geo* aBesG4Geo         = new BesG4Geo();
    logicalBes                  = aBesG4Geo->GetTopVolume();

    for (int i = 1; i != 9; ++i) {
        G4LogicalVolume* logicalAirVolume = const_cast<G4LogicalVolume*>(
            GDMLProcessor::GetInstance()->GetLogicalVolume(matNames[i]));
        mat = logicalAirVolume->GetMaterial();
        G4MtovKalFitM(mat, matNames[i]);
    }
    delete aMdcG4Geo;
    delete aBesG4Geo;
    for (int i = 1; i != 4; ++i)
        AddWalls(i);

    /// air cylinder is special
    G4Tubs* innerwallTub = getTubs("LogicalMdcInnerFilm0");
    G4Tubs* outerBeTub   = getTubs("logicalouterBe");
    double radius        = outerBeTub->GetOuterRadius() / (cm);
    double thick         = innerwallTub->GetInnerRadius() /
                   (cm)-outerBeTub->GetOuterRadius() / (cm);
    double length = 2.0 * innerwallTub->GetZHalfLength() / (cm);
    double z0     = 0.0;
    AddWalls(4, radius, thick, length, z0);

    for (int i = 5; i != 9; ++i)
        AddWalls(i);

    /// the air in the innermost of the pipe
    G4Tubs* goldLayerTub = getTubs("logicalgoldLayer");
    radius               = 0.;
    thick                = goldLayerTub->GetInnerRadius() / (cm);
    length               = 2.0 * goldLayerTub->GetZHalfLength() / (cm);
    z0                   = 0.0;
    AddWalls(4, radius, thick, length, z0);
    // // debug
    // for (int i = 0; i < 9; ++i)
    //     testMW(i);
}

int VertexExtrapolate::getWallMdcNumber(const HepPoint3D& point) const
{
    int i = m_BesKalmanExtWalls.size() - 1;
    for (; i != -1; --i)
        if (m_BesKalmanExtWalls[i].isInside2(point)) break;

    return i;
}

void VertexExtrapolate::extToAnyPoint(KalFitTrack& track,
                                      const HepPoint3D& point)
{
    const int index = getWallMdcNumber(point);

    // outside the inner MDC wall Film1
    if (index == -1) return;
    // in the innermost pipe
    if (index > 0) {
        for (int j = 0; j < index; j++)
            m_BesKalmanExtWalls[j].updateTrack(track, 1);
    }
    if (index != m_BesKalmanExtWalls.size() - 1) {
        const KalFitMaterial& material = m_BesKalmanExtWalls[index].material();
        HepPoint3D x;

        double path = m_BesKalmanExtWalls[index].intersect(track, x, point);

        if (path > 0) {
            // move pivot
            track.pivot_numf(x);
            // multiple scattering and energy loss
            int index_element(index);
            if (index_element == 0) index_element = 1;
            track.ms(path, material, index_element);
            track.eloss(path, material, index_element);
        }
    }
}

void VertexExtrapolate::KalFitExt(const HepPoint3D& point,
                                  DstMdcKalTrack* kalTrack, const int pid)
{
    HepVector tdsHelix     = kalTrack->getFHelix(pid);
    HepSymMatrix tdsMatrix = kalTrack->getFError(pid);

    HepPoint3D IP(0., 0., 0.);
    // construct a KalFitTrack
    KalFitTrack fitTrack(IP, tdsHelix, tdsMatrix, pid, 0, 0);

    // const double radius = 7.885; // centimeter first MDC wire?
    const double rp = point.perp();
    // const double radius = m_BesKalmanExtWalls[m_BesKalmanExtWalls.size() - 1]
    //                           .radius(); // outer radius
    const double radius = m_BesKalmanExtWalls[0].radius(); // outer radius
    const double dphi   = fitTrack.intersect_cylinder(std::max(rp, radius));
    const HepPoint3D lastPivot = fitTrack.x(dphi);
    fitTrack.pivot(lastPivot);
    if (rp <= radius) extToAnyPoint(fitTrack, point);

    ///////// why pivot to IP? ///////
    // // set the pivot back to IP
    fitTrack.pivot(IP); // for convention?
    setHelixVector(fitTrack.a());
    setErrorMatrix(fitTrack.Ea());
}
/* ===================================================================<<< */
/* ================== VertexExtrapolate.cxx ends here =================== */
