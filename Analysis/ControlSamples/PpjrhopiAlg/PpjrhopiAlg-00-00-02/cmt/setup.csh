# echo "setup PpjrhopiAlg PpjrhopiAlg-00-00-02 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtPpjrhopiAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtPpjrhopiAlgtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=PpjrhopiAlg -version=PpjrhopiAlg-00-00-02 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples  -no_cleanup $* >${cmtPpjrhopiAlgtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=PpjrhopiAlg -version=PpjrhopiAlg-00-00-02 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples  -no_cleanup $* >${cmtPpjrhopiAlgtempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtPpjrhopiAlgtempfile}
  unset cmtPpjrhopiAlgtempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtPpjrhopiAlgtempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtPpjrhopiAlgtempfile}
unset cmtPpjrhopiAlgtempfile
exit $cmtsetupstatus

