/* <===<===<===<===<===<===<===<===<===~===>===>===>===>===>===>===>===>===>
 * File Name:    VertexExtrapolate.h
 * Author:       Hao-Kai SUN
 * Created:      2021-09-06 Mon 18:02:17 CST
 * <<=====================================>>
 * Last Updated: 2021-10-18 Mon 17:17:47 CST
 *           By: Hao-Kai SUN <sunhk@ihep.ac.cn>
 *     Update #: 39
 * ============================== CODES ==============================>>> */
#ifndef VERTEXFIT_VERTEXEXTRAPOLATE_H
#define VERTEXFIT_VERTEXEXTRAPOLATE_H
//// constants
#ifndef NULL
#define NULL 0
#endif

#ifndef R__NULLPTR
#ifndef nullptr
#define nullptr 0
#endif
#endif
////
#include "G4Material.hh"
#include "G4Tubs.hh"
#include "GDMLProcessor.hh"
#include "KalFitAlg/KalFitCylinder.h"
#include "KalFitAlg/KalFitMaterial.h"

#include "DstEvent/DstMdcKalTrack.h"

#include <string>

class VertexExtrapolate
{
  public:
    static VertexExtrapolate* instance();
    ~VertexExtrapolate() {}
    void KalFitExt(const HepPoint3D& point, DstMdcKalTrack* kalTrack,
                   const int pid);

    const HepVector getHelixVector() const;
    const HepSymMatrix getErrorMatrix() const;

  private:
    VertexExtrapolate();
    static VertexExtrapolate* m_instance;

    G4Tubs* getTubs(const std::string& name);
    void G4MtovKalFitM(G4Material* g4m, const std::string& name);
    void AddWalls(int index, double radius, double thick, double length,
                  double z0);
    void AddWalls(int index);
    void testMW(int index);
    void constructWallsFromGdml();

    void setHelixVector(const CLHEP::HepVector a);
    void setErrorMatrix(const CLHEP::HepSymMatrix Ea);

    int getWallMdcNumber(const HepPoint3D& point) const;
    void extToAnyPoint(KalFitTrack& track, const HepPoint3D& point);

    /// Properties
    std::vector<KalFitCylinder> m_BesKalmanExtWalls;
    std::vector<KalFitMaterial> m_BesKalmanExtMaterials;

    CLHEP::HepVector m_helixVector;
    CLHEP::HepSymMatrix m_errorMatrix;
};

inline const HepVector VertexExtrapolate::getHelixVector() const
{
    return m_helixVector;
}

inline const HepSymMatrix VertexExtrapolate::getErrorMatrix() const
{
    return m_errorMatrix;
}

inline void VertexExtrapolate::setHelixVector(const CLHEP::HepVector a)
{
    m_helixVector = a;
}

inline void VertexExtrapolate::setErrorMatrix(const CLHEP::HepSymMatrix Ea)
{
    m_errorMatrix = Ea;
}

inline G4Tubs* VertexExtrapolate::getTubs(const std::string& name)
{
    return dynamic_cast<G4Tubs*>(
        const_cast<G4LogicalVolume*>(
            GDMLProcessor::GetInstance()->GetLogicalVolume(name))
            ->GetSolid());
}

#endif /* VERTEXFIT_VERTEXEXTRAPOLATE_H */
/* ===================================================================<<< */
/* =================== VertexExtrapolate.h ends here ==================== */
