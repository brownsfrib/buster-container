#!/bin/bash

##########################################
# Starting bashrc for microball analysis #
##########################################
export imgBuster="/usr/opt/nscl-buster.img"
export imgName="TestContainer"
export basePath=$(pwd)

if [ -v $SINGULARITY_NAME ]; then
	echo -e "\033[1;35mStarting Buster container (sourcing $basePath/container.sh)\033[0m"
	source container.sh
else
	if [ -f $basePath/.bashrc ]; then
		. $basePath/.bashrc
	fi
fi
