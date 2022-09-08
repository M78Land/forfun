# echo "setup McCor McCor-00-00-17 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtMcCortempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtMcCortempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=McCor -version=McCor-00-00-17 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor  -no_cleanup $* >${cmtMcCortempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=McCor -version=McCor-00-00-17 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor  -no_cleanup $* >${cmtMcCortempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtMcCortempfile}
  unset cmtMcCortempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtMcCortempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtMcCortempfile}
unset cmtMcCortempfile
exit $cmtsetupstatus

