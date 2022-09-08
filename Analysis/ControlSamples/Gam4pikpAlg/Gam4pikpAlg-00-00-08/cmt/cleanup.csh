# echo "cleanup Gam4pikpAlg Gam4pikpAlg-00-00-08 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtGam4pikpAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtGam4pikpAlgtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=Gam4pikpAlg -version=Gam4pikpAlg-00-00-08 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples  $* >${cmtGam4pikpAlgtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=Gam4pikpAlg -version=Gam4pikpAlg-00-00-08 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples  $* >${cmtGam4pikpAlgtempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtGam4pikpAlgtempfile}
  unset cmtGam4pikpAlgtempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtGam4pikpAlgtempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtGam4pikpAlgtempfile}
unset cmtGam4pikpAlgtempfile
exit $cmtcleanupstatus

