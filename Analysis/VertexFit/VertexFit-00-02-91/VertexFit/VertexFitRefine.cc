/* <===<===<===<===<===<===<===<===<===~===>===>===>===>===>===>===>===>===>
 * File Name:    VertexFitRefine.cc
 * Author:       Hao-Kai SUN
 * Created:      2021-10-26 Tue 16:02:04 CST
 * <<=====================================>>
 * Last Updated: 2021-10-28 Thu 12:12:14 CST
 *           By: Hao-Kai SUN <sunhk@ihep.ac.cn>
 *     Update #: 29
 * ============================== CODES ==============================>>> */
#ifndef VERTEXFIT_VERTEXFITREFINE_CC
#define VERTEXFIT_VERTEXFITREFINE_CC
#pragma once

#include "VertexFit/VertexFitRefine.h"

// add methods
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar,
                                       std::vector<int> lis)
{
    vtxfit->AddVertex(number, vpar, lis);
}
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar, int n1,
                                       int n2)
{
    vtxfit->AddVertex(number, vpar, n1, n2);
}
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar, int n1,
                                       int n2, int n3)
{
    vtxfit->AddVertex(number, vpar, n1, n2, n3);
}
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar, int n1,
                                       int n2, int n3, int n4)
{
    vtxfit->AddVertex(number, vpar, n1, n2, n3, n4);
}
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar, int n1,
                                       int n2, int n3, int n4, int n5)
{
    vtxfit->AddVertex(number, vpar, n1, n2, n3, n4, n5);
}
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar, int n1,
                                       int n2, int n3, int n4, int n5, int n6)
{
    vtxfit->AddVertex(number, vpar, n1, n2, n3, n4, n5, n6);
}
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar, int n1,
                                       int n2, int n3, int n4, int n5, int n6,
                                       int n7)
{
    vtxfit->AddVertex(number, vpar, n1, n2, n3, n4, n5, n6, n7);
}
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar, int n1,
                                       int n2, int n3, int n4, int n5, int n6,
                                       int n7, int n8)
{
    vtxfit->AddVertex(number, vpar, n1, n2, n3, n4, n5, n6, n7, n8);
}
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar, int n1,
                                       int n2, int n3, int n4, int n5, int n6,
                                       int n7, int n8, int n9)
{
    vtxfit->AddVertex(number, vpar, n1, n2, n3, n4, n5, n6, n7, n8, n9);
}
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar, int n1,
                                       int n2, int n3, int n4, int n5, int n6,
                                       int n7, int n8, int n9, int n10)
{
    vtxfit->AddVertex(number, vpar, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10);
}
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar, int n1,
                                       int n2, int n3, int n4, int n5, int n6,
                                       int n7, int n8, int n9, int n10, int n11)
{
    vtxfit->AddVertex(number, vpar, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
                      n11);
}
inline void VertexFitRefine::AddVertex(int number, VertexParameter vpar, int n1,
                                       int n2, int n3, int n4, int n5, int n6,
                                       int n7, int n8, int n9, int n10, int n11,
                                       int n12)
{
    vtxfit->AddVertex(number, vpar, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
                      n11, n12);
}
inline void VertexFitRefine::AddBeamFit(int number, VertexParameter vpar, int n)
{
    vtxfit->AddBeamFit(number, vpar, n);
}

// set iteration number and chisq cut
inline void VertexFitRefine::setIterNumber(const int niter)
{
    vtxfit->setIterNumber(niter);
}
inline void VertexFitRefine::setChisqCut(const double chicut,
                                         const double chiter)
{
    vtxfit->setChisqCut(chicut, chiter);
}
inline void VertexFitRefine::setMagCorrFactor(const double factor)
{
    vtxfit->setMagCorrFactor(factor);
}

// inline void VertexFitRefine::AddVertex(const int index, VertexParameter vpar,
//                                        int p0, int p1)
// {
//     m_vtxidx = index;
//     m_vpar   = vpar;
// }
inline bool VertexFitRefine::Fit(int n)
{
    return Fit();
}

inline double VertexFitRefine::chisq() const
{
    return vtxfit->chisq(0);
}

inline double VertexFitRefine::chisq(int n) const
{
    return vtxfit->chisq(0);
}

inline HepLorentzVector VertexFitRefine::pfit(int n) const
{
    return vtxfit->pfit(n);
}

inline HepPoint3D VertexFitRefine::xfit(int n) const
{
    return vtxfit->xfit(n);
}

inline HepVector VertexFitRefine::w(int n) const
{
    return vtxfit->w(n);
}

inline HepSymMatrix VertexFitRefine::Ew(int n) const
{
    return vtxfit->Ew(n);
}

inline WTrackParameter VertexFitRefine::wtrk(int n) const
{
    return vtxfit->wtrk(n);
}

inline HepPoint3D VertexFitRefine::vx(int n) const
{
    return vtxfit->vx(n);
}

inline HepVector VertexFitRefine::Vx(int n) const
{
    return vtxfit->Vx(n);
}

inline HepSymMatrix VertexFitRefine::Evx(int n) const
{
    return vtxfit->Evx(n);
}

inline double VertexFitRefine::errorVx(int n, int i) const
{
    return vtxfit->errorVx(n, i);
}

inline VertexParameter VertexFitRefine::vpar(int n) const
{
    return vtxfit->vpar(n);
}

inline WTrackParameter VertexFitRefine::wVirtualTrack(int n) const
{
    return vtxfit->wVirtualTrack(n);
}

inline int VertexFitRefine::getPath() const
{
    return thePath;
}

#endif /* VERTEXFIT_VERTEXFITREFINE_CC */
/* ===================================================================<<< */
/* ==================== VertexFitRefine.cc ends here ==================== */
