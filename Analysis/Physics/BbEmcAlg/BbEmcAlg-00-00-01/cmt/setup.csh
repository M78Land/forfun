# echo "setup BbEmcAlg BbEmcAlg-00-00-01 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtBbEmcAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtBbEmcAlgtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=BbEmcAlg -version=BbEmcAlg-00-00-01 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics  -no_cleanup $* >${cmtBbEmcAlgtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=BbEmcAlg -version=BbEmcAlg-00-00-01 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics  -no_cleanup $* >${cmtBbEmcAlgtempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtBbEmcAlgtempfile}
  unset cmtBbEmcAlgtempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtBbEmcAlgtempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtBbEmcAlgtempfile}
unset cmtBbEmcAlgtempfile
exit $cmtsetupstatus

