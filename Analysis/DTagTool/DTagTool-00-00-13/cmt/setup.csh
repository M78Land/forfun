# echo "setup DTagTool DTagTool-00-00-13 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtDTagTooltempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtDTagTooltempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=DTagTool -version=DTagTool-00-00-13 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  -no_cleanup $* >${cmtDTagTooltempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=DTagTool -version=DTagTool-00-00-13 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  -no_cleanup $* >${cmtDTagTooltempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtDTagTooltempfile}
  unset cmtDTagTooltempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtDTagTooltempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtDTagTooltempfile}
unset cmtDTagTooltempfile
exit $cmtsetupstatus

