# echo "cleanup PpjrhopiAlg PpjrhopiAlg-00-00-02 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtPpjrhopiAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtPpjrhopiAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=PpjrhopiAlg -version=PpjrhopiAlg-00-00-02 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples  $* >${cmtPpjrhopiAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=PpjrhopiAlg -version=PpjrhopiAlg-00-00-02 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/ControlSamples  $* >${cmtPpjrhopiAlgtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtPpjrhopiAlgtempfile}
  unset cmtPpjrhopiAlgtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtPpjrhopiAlgtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtPpjrhopiAlgtempfile}
unset cmtPpjrhopiAlgtempfile
return $cmtcleanupstatus

