# echo "setup DumpDecayTreeAlg DumpDecayTreeAlg-00-00-04 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtDumpDecayTreeAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtDumpDecayTreeAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=DumpDecayTreeAlg -version=DumpDecayTreeAlg-00-00-04 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  -no_cleanup $* >${cmtDumpDecayTreeAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=DumpDecayTreeAlg -version=DumpDecayTreeAlg-00-00-04 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  -no_cleanup $* >${cmtDumpDecayTreeAlgtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtDumpDecayTreeAlgtempfile}
  unset cmtDumpDecayTreeAlgtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtDumpDecayTreeAlgtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtDumpDecayTreeAlgtempfile}
unset cmtDumpDecayTreeAlgtempfile
return $cmtsetupstatus

