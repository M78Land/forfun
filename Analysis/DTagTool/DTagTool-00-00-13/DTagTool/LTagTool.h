
#ifndef CLASS_DTAGTOOL_H
#define CLASS_DTAGTOOL_H

#include "GaudiKernel/ObjectVector.h"
#include "GaudiKernel/AlgFactory.h"
#include "GaudiKernel/Algorithm.h"
#include "GaudiKernel/NTuple.h"
#include "GaudiKernel/IDataProviderSvc.h"

#include "CLHEP/Vector/LorentzVector.h"
#include "EvtRecEvent/EvtRecTrack.h"
#include "EvtRecEvent/EvtRecDTag.h"
#include "EvtRecEvent/EvtRecVeeVertex.h"
#include "EvtRecEvent/EvtRecPi0.h"


#include <iostream>

using namespace std;

typedef EvtRecDTagCol::iterator DTagToolIterator;
typedef EvtRecPi0Col::iterator pi0Iterator;
typedef EvtRecVeeVertexCol::iterator ksIterator;


class LTagTool{

 public:
  
  LTagTool  ();

  ~LTagTool ();

  //LTag operations
  bool isDTagListEmpty() { return m_isdtaglistempty; }
  void setPID(bool pid) {m_pid = pid;}


  
  EvtRecDTagCol::iterator modes_begin(){ return m_iterbegin;}
  EvtRecDTagCol::iterator modes_end(){ return m_iterend;}
  EvtRecPi0Col::iterator pi0_begin(){ return m_pi0iterbegin;}
  EvtRecVeeVertexCol::iterator ks_begin(){ return m_ksiterbegin;}

 
  vector<int>  D0modes() { return m_d0modes;}
  vector<int>  Dpmodes() { return m_dpmodes;}
  vector<int>  Dsmodes() { return m_dsmodes;}

  vector<int> mode(EvtRecDTag::DecayMode decaymode);
  vector<int> mode(int decaymode);



  bool findSTag(EvtRecDTag::DecayMode mode, int tagcharm);
  bool findSTag(EvtRecDTag::DecayMode mode);
  bool findDTag(EvtRecDTag::DecayMode mode1, EvtRecDTag::DecayMode mode2,string smass="mbc");
  //bool findDTag(EvtRecDTag::DecayMode mode1, int tagcharm1,EvtRecDTag::DecayMode mode2, int tagcharm2,string smass="mbc" );
  bool findADTag(EvtRecDTag::DecayMode mode1, EvtRecDTag::DecayMode mode2);
  bool findADTag(EvtRecDTag::DecayMode mode1, int tagcharm1,EvtRecDTag::DecayMode mode2, int tagcharm2 );

  bool findSTag(int mode, int tagcharm);
  bool findSTag(int mode);
  bool findDTag(int mode1, int mode2, string smass="mbc");
 // bool findDTag(int mode1, int tagcharm1,int mode2, int tagcharm2,string smass="mbc" );
  bool findDTag(int mode1, int tagcharm1,int mode2, int tagcharm2);//deltaE
  bool findADTag(int mode1, int mode2);
	bool findADTag(int mode1, int tagcharm1,int mode2, int tagcharm2);
//add by lipr
  int count() { return m_count;}
	int veto(DTagToolIterator iter_tp);
	int savemode0(DTagToolIterator iter_tp);
	int savemode1(DTagToolIterator iter_tp);
	int savemode2(DTagToolIterator iter_tp);
	int savemode3(DTagToolIterator iter_tp);
	int savemode4(DTagToolIterator iter_tp);
	int savemode5(DTagToolIterator iter_tp);
	int savemode30(DTagToolIterator iter_tp);
	int savemode31(DTagToolIterator iter_tp);
	int savemode32(DTagToolIterator iter_tp);
	int savemode33(DTagToolIterator iter_tp);
	int savemode34(DTagToolIterator iter_tp);
	int savemode60(DTagToolIterator iter_tp);
	int savemode61(DTagToolIterator iter_tp);
	int savemode62(DTagToolIterator iter_tp);
	int savemode63(DTagToolIterator iter_tp);
	int savemode64(DTagToolIterator iter_tp);
	HepLorentzVector getP4(RecEmcShower* gTrk);
	void savepi0(RecEmcShower *shr1,RecEmcShower *shr2,double& pi0_chis,HepLorentzVector& p4_pi0,HepLorentzVector& p4_pi0_1c,WTrackParameter& wvlmd);
	void saveeta(RecEmcShower *shr1,RecEmcShower *shr2,double& eta_chis,HepLorentzVector& p4_eta,HepLorentzVector& p4_eta_1c,WTrackParameter& wvlmd);
void savelmd(RecMdcKalTrack* ppFlmdTrk,RecMdcKalTrack* pimFlmdTrk,double& lmd_1chis,double& lmd_2chis,double& lmd_dl,double& lmd_dle,double& lmd_lchue,HepLorentzVector& p4_lmd_1s,HepLorentzVector& p4_lmd_2s,int& lmd_state,WTrackParameter& wvlmd);
void saveks(RecMdcKalTrack* pipTrk,RecMdcKalTrack* pimTrk,double& ks_1chis,double& ks_2chis,double& ks_dl,double& ks_dle,double& ks_lchue,HepLorentzVector& p4_ks_1s,HepLorentzVector& p4_ks_2s, int& ks_state,WTrackParameter& wvks);

  
  EvtRecDTagCol::iterator stag(){ return m_iterstag;}
  EvtRecDTagCol::iterator dtag1(){ return m_iterdtag1;}
  EvtRecDTagCol::iterator dtag2(){ return m_iterdtag2;}
  vector<EvtRecDTagCol::iterator> vdtag1(){ return m_viterdtag1;}
  vector<EvtRecDTagCol::iterator> vdtag2(){ return m_viterdtag2;}


  void operator<< ( EvtRecDTagCol::iterator iter);


  //other utilities
  HepLorentzVector pi0p4(EvtRecPi0Col::iterator pi0Itr, bool isconstrain=true);
  vector<int> pi0Id(EvtRecDTagCol::iterator iter, int numpi0=1);
  vector<int> ksId(EvtRecDTagCol::iterator iter, int numks=1);
  HepLorentzVector p4shower(RecEmcShower* shower);
  HepLorentzVector p4(RecMdcKalTrack* mdcKalTrack, int pid);
  bool isGoodTrack( EvtRecTrack* trk);
  bool isGoodShower( EvtRecTrack* trk);
  bool cosmicandleptonVeto();
  int  numofShowerAboveThreshold();
  int  numofShowerAboveThreshold(int threshold);
  bool shareTracks(EvtRecDTagCol::iterator iter1, EvtRecDTagCol::iterator iter2);


  void clear();
  void name(){ cout<<" I am the dtag tool"<<endl;}
  
 protected:
  
  IDataProviderSvc* eventSvc();
  
  
 private:
  
  bool m_isdtaglistempty;

  IDataProviderSvc* m_evtSvc;



  EvtRecDTagCol::iterator m_iterbegin;
  EvtRecDTagCol::iterator m_iterend;
  EvtRecPi0Col::iterator m_pi0iterbegin;
  EvtRecPi0Col::iterator m_pi0iterend;
  EvtRecVeeVertexCol::iterator m_ksiterbegin;
  EvtRecVeeVertexCol::iterator m_ksiterend;
  

  bool m_pid;

  EvtRecDTagCol::iterator m_iterstag;
  EvtRecDTagCol::iterator m_iterdtag1;
  EvtRecDTagCol::iterator m_iterdtag2;
  vector<EvtRecDTagCol::iterator> m_viterdtag1;
  vector<EvtRecDTagCol::iterator> m_viterdtag2;


  int m_count;

  vector<int> m_d0modes;
  vector<int> m_dpmodes;
  vector<int> m_dsmodes;

  EvtRecTrackIterator m_chargebegin;
  EvtRecTrackIterator m_chargeend;
  EvtRecTrackIterator m_showerbegin;
  EvtRecTrackIterator m_showerend;

  
};




#endif
