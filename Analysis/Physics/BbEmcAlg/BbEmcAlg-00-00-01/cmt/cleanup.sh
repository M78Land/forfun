# echo "cleanup BbEmcAlg BbEmcAlg-00-00-01 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtBbEmcAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtBbEmcAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=BbEmcAlg -version=BbEmcAlg-00-00-01 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics  $* >${cmtBbEmcAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=BbEmcAlg -version=BbEmcAlg-00-00-01 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics  $* >${cmtBbEmcAlgtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtBbEmcAlgtempfile}
  unset cmtBbEmcAlgtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtBbEmcAlgtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtBbEmcAlgtempfile}
unset cmtBbEmcAlgtempfile
return $cmtcleanupstatus

