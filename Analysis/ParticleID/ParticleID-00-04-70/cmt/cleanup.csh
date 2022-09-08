# echo "cleanup ParticleID ParticleID-00-04-70 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtParticleIDtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtParticleIDtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=ParticleID -version=ParticleID-00-04-70 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  -quiet -with_version_directory $* >${cmtParticleIDtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=ParticleID -version=ParticleID-00-04-70 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  -quiet -with_version_directory $* >${cmtParticleIDtempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtParticleIDtempfile}
  unset cmtParticleIDtempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtParticleIDtempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtParticleIDtempfile}
unset cmtParticleIDtempfile
exit $cmtcleanupstatus

