# echo "setup BbEmcAlg BbEmcAlg-00-00-01 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtBbEmcAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtBbEmcAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=BbEmcAlg -version=BbEmcAlg-00-00-01 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics  -no_cleanup $* >${cmtBbEmcAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=BbEmcAlg -version=BbEmcAlg-00-00-01 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis/Physics  -no_cleanup $* >${cmtBbEmcAlgtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtBbEmcAlgtempfile}
  unset cmtBbEmcAlgtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtBbEmcAlgtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtBbEmcAlgtempfile}
unset cmtBbEmcAlgtempfile
return $cmtsetupstatus

