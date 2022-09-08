# echo "setup AbsCor AbsCor-00-00-40 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtAbsCortempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtAbsCortempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=AbsCor -version=AbsCor-00-00-40 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor  -quiet -with_version_directory -no_cleanup $* >${cmtAbsCortempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=AbsCor -version=AbsCor-00-00-40 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor  -quiet -with_version_directory -no_cleanup $* >${cmtAbsCortempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtAbsCortempfile}
  unset cmtAbsCortempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtAbsCortempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtAbsCortempfile}
unset cmtAbsCortempfile
exit $cmtsetupstatus

