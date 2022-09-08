# echo "setup ParticleID ParticleID-00-04-70 in /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/bes3.ihep.ac.cn/bes3sw/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtParticleIDtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtParticleIDtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=ParticleID -version=ParticleID-00-04-70 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  -quiet -with_version_directory -no_cleanup $* >${cmtParticleIDtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=ParticleID -version=ParticleID-00-04-70 -path=/cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/Analysis  -quiet -with_version_directory -no_cleanup $* >${cmtParticleIDtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtParticleIDtempfile}
  unset cmtParticleIDtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtParticleIDtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtParticleIDtempfile}
unset cmtParticleIDtempfile
return $cmtsetupstatus

