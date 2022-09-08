# echo "cleanup PipiJpsiAlg PipiJpsiAlg-00-00-03 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics/PsiPrime"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtPipiJpsiAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtPipiJpsiAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=PipiJpsiAlg -version=PipiJpsiAlg-00-00-03 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics/PsiPrime  $* >${cmtPipiJpsiAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=PipiJpsiAlg -version=PipiJpsiAlg-00-00-03 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics/PsiPrime  $* >${cmtPipiJpsiAlgtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtPipiJpsiAlgtempfile}
  unset cmtPipiJpsiAlgtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtPipiJpsiAlgtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtPipiJpsiAlgtempfile}
unset cmtPipiJpsiAlgtempfile
return $cmtcleanupstatus

