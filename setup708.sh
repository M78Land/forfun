#Pull the specific image from my DockerHub, barbohrben
docker image pull barbohrben/boss:complete

#run the image in the background, named boss. And the parameter, --privileged, is necessary for mount cvmfs. The command, sleep 1d, makes it keeping running for one day in the background
docker container run -d --name boss --privileged barbohrben/boss:complete sleep 1d

docker container exec boss make

#Mount necessary dictionaries inside the container that we run above
docker container exec boss mount -t cvmfs sft.cern.ch /cvmfs/sft.cern.ch
docker container exec boss mount -t cvmfs container.ihep.ac.cn /cvmfs/container.ihep.ac.cn
docker container exec boss mount -t cvmfs bes3.ihep.ac.cn /cvmfs/bes3.ihep.ac.cn

#Set the environment for boss 7.0.8
#Those commands come from BES3 Document
#Due to the characters of container, we need to write all the commands to a script. And then source the script. Otherwise, we can do nothing.
docker container exec boss /bin/bash -c 'echo "cd /home" | sudo tee /home/setup708.sh'
docker container exec boss /bin/bash -c 'echo "mkdir cmthome && mkdir workarea" | sudo tee -a /home/setup708.sh'
docker container exec boss /bin/bash -c 'echo "cd cmthome" | sudo tee -a /home/setup708.sh'
docker container exec boss /bin/bash -c 'echo "cp /cvmfs/bes3.ihep.ac.cn/bes3sw/cmthome/cmthome-7.0.8/* /home/cmthome/" | sudo tee -a /home/setup708.sh'
docker container exec boss /bin/bash -c "echo \"sed -i '44c macro WorkArea \\\"/home/workarea\\\"' requirements\" | sudo tee -a /home/setup708.sh"
docker container exec boss /bin/bash -c "echo \"sed -i '46,47c path_remove CMTPATH  \\\"\\\${WorkArea}\\\"\npath_prepend CMTPATH \\\"\\\${WorkArea}\\\"' requirements\"| sudo tee -a /home/setup708.sh"
docker container exec boss /bin/bash -c 'echo "source setupCMT.sh" | sudo tee -a /home/setup708.sh'
docker container exec boss /bin/bash -c 'echo "cmt config && source setup.sh" | sudo tee -a /home/setup708.sh'
docker container exec boss /bin/bash -c 'echo "cp -r /cvmfs/bes3.ihep.ac.cn/bes3sw/Boss/7.0.8/TestRelease /home/workarea/" | sudo tee -a /home/setup708.sh'
docker container exec boss /bin/bash -c 'echo "cd /home/workarea/TestRelease/*/cmt" | sudo tee -a /home/setup708.sh'
docker container exec boss /bin/bash -c 'echo "cmt broadcast cmt config" | sudo tee -a /home/setup708.sh'
docker container exec boss /bin/bash -c 'echo "source setup.sh" | sudo tee -a /home/setup708.sh'

#Run an example
#docker container exec boss /bin/bash -c 'echo "cd ../run&&boss.exe jobOptions_sim.txt"  | sudo tee -a /home/run_example.sh'
#docker container exec boss /bin/bash -c 'echo "boss.exe jobOptions_rec.txt"  | sudo tee -a /home/run_example.sh'
#docker container exec boss /bin/bash -c 'echo "boss.exe jobOptions_ana_rhopi.txt"  | sudo tee -a /home/run_example.sh'

#Finally, please remember to source the script
docker container exec boss /bin/bash -c 'source /home/setup708.sh'
