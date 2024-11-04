#!/bin/bash

#################################
# Function to start environment # 
#################################

function start_(){
	export SINGULARITY_SHELL=/bin/bash
	singularity shell --contain --pwd $basePath --workdir $basePath --home $basePath \
		--bind /usr/lib \
		--bind /usr/opt \
		--bind /usr/opt/include_modules-buster.sh:/etc/profile.d/module.sh \
		--bind /mnt \
		--bind /mnt/misc/sw/indep \
		--bind /mnt/misc/sw/x86_64/all \
		--bind /usr/lib/x86_64-linux-gnu \
		--bind /usr/lib/x86_64-linux-gnu/modulecmd.tcl \
		--bind /etc/profile.d/module.sh \
		instance://$imgName --rcfile $basePath/.bashrc

}

#################################################################
# Tests for the existance of "microball" named buster container #
#################################################################

currentImg=($(singularity instance.list | grep $imgName))

if [ "$imgName" != "$currentImg" ]; then
        singularity instance.start $imgBuster $imgName
	echo -e "\033[1;32mCreated buster singularity instance ${imgName}\033[0m"
	singularity instance.list
	start_
else
	singularity instance.list
	start_
fi      
 
