# echo "cleanup McCor McCor-00-00-17 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtMcCortempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtMcCortempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=McCor -version=McCor-00-00-17 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor  $* >${cmtMcCortempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=McCor -version=McCor-00-00-17 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor  $* >${cmtMcCortempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtMcCortempfile}
  unset cmtMcCortempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtMcCortempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtMcCortempfile}
unset cmtMcCortempfile
return $cmtcleanupstatus

