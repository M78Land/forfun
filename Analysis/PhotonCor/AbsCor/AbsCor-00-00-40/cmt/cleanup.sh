# echo "cleanup AbsCor AbsCor-00-00-40 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtAbsCortempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtAbsCortempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=AbsCor -version=AbsCor-00-00-40 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor  -quiet -with_version_directory $* >${cmtAbsCortempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=AbsCor -version=AbsCor-00-00-40 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/PhotonCor  -quiet -with_version_directory $* >${cmtAbsCortempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtAbsCortempfile}
  unset cmtAbsCortempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtAbsCortempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtAbsCortempfile}
unset cmtAbsCortempfile
return $cmtcleanupstatus

