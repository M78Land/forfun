# echo "cleanup Gam4pikpAlg Gam4pikpAlg-00-00-08 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtGam4pikpAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtGam4pikpAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=Gam4pikpAlg -version=Gam4pikpAlg-00-00-08 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples  $* >${cmtGam4pikpAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=Gam4pikpAlg -version=Gam4pikpAlg-00-00-08 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples  $* >${cmtGam4pikpAlgtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtGam4pikpAlgtempfile}
  unset cmtGam4pikpAlgtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtGam4pikpAlgtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtGam4pikpAlgtempfile}
unset cmtGam4pikpAlgtempfile
return $cmtcleanupstatus

