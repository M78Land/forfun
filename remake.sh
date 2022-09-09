#Set the environment
docker container exec boss /bin/bash -c 'echo "cd /home/cmthome" | sudo tee /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "source setupCMT.sh" | sudo tee -a /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "cmt config && source setup.sh" | sudo tee  -a /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "cd /home/workarea/TestRelease/*/cmt" | sudo tee -a /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "cmt broadcast cmt config" | sudo tee -a /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "source setup.sh" | sudo tee -a /home/remake.sh'

#Copy the package modified by you to the workarea inside the docker
docker cp ./Analysis boss:/home/workarea/

#Copy the dictionary need to be written to the workarea
docker container exec boss /bin/bash -c 'cp -r /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/InstallArea /home/workarea'

#modify the cxx
docker container exec boss /bin/bash -c "sed -i '939a cout<<\\\"It is a vital success for jiangdi\\\"<<endl;' /home/workarea/Analysis/Physics/RhopiAlg/RhopiAlg-00-00-23/src/Rhopi.cxx"
docker container exec boss /bin/bash -c 'cat /home/workarea/Analysis/Physics/RhopiAlg/RhopiAlg-00-00-23/src/Rhopi.cxx'

docker container exec boss /bin/bash -c 'echo "cd /home/workarea/Analysis/Physics/RhopiAlg/RhopiAlg-00-00-23/cmt" | sudo tee -a /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "cmt config" | sudo tee -a /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "source setup.sh" | sudo tee -a /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "make" | sudo tee -a /home/remake.sh'

docker container exec boss /bin/bash -c 'echo "cd /home/workarea/TestRelease/*/cmt" | sudo tee -a /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "cmt broadcast cmt config" | sudo tee -a /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "source setup.sh" | sudo tee -a /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "cd ../run" | sudo tee -a /home/remake.sh'
docker container exec boss /bin/bash -c 'echo "boss.exe jobOptions_sim.txt&&boss.exe jobOptions_rec.txt&&boss.exe jobOptions_ana_rhopi.txt" | sudo tee -a /home/remake.sh'
#docker container exec boss /bin/bash -c ' | sudo tee /home/remake.sh'

docker container exec boss /bin/bash -c 'source /home/remake.sh'
