# echo "cleanup DTagTool DTagTool-00-00-13 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtDTagTooltempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtDTagTooltempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=DTagTool -version=DTagTool-00-00-13 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  $* >${cmtDTagTooltempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=DTagTool -version=DTagTool-00-00-13 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  $* >${cmtDTagTooltempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtDTagTooltempfile}
  unset cmtDTagTooltempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtDTagTooltempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtDTagTooltempfile}
unset cmtDTagTooltempfile
return $cmtcleanupstatus

