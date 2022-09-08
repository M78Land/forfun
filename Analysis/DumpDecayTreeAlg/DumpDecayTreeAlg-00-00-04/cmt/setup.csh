# echo "setup DumpDecayTreeAlg DumpDecayTreeAlg-00-00-04 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtDumpDecayTreeAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtDumpDecayTreeAlgtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=DumpDecayTreeAlg -version=DumpDecayTreeAlg-00-00-04 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  -no_cleanup $* >${cmtDumpDecayTreeAlgtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=DumpDecayTreeAlg -version=DumpDecayTreeAlg-00-00-04 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  -no_cleanup $* >${cmtDumpDecayTreeAlgtempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtDumpDecayTreeAlgtempfile}
  unset cmtDumpDecayTreeAlgtempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtDumpDecayTreeAlgtempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtDumpDecayTreeAlgtempfile}
unset cmtDumpDecayTreeAlgtempfile
exit $cmtsetupstatus

