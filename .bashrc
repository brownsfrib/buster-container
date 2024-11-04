if [ -f .bash_functions ]; then
	. .bash_functions
fi
if [ -f .bash_aliases ]; then
	. .bash_aliases
fi

export HISTTIMEFORMAT='%F~%T $ '

echo -e "Running container on \033[1;33m$SINGULARITY_NAME\033[0m"

PROMPT_COMMAND="ps1ID=$imgName"
export PS1='\[\033[1;93m\]($ps1ID)\[\033[0m\] <\h:\W> '

# Setting Linux libraries
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH

# Sourcing modules
source /etc/profile.d/modules.sh

# Loading in GCC compiler and ROOT 6.16.00
module load cmake/3.16.9
module load gnu/gcc/8.2

# Loading in ROOT 
module load root/gnu/6.16.00
export PATH=$ROOTSYS/bin:$PATH
export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH
export ROOT_INCLUDE_PATH=$basePath/macros/include:$ROOT_INCLUDE_PATH

# Loading in python3.7
module load anaconda/python3.7

# Loading in Geant4/NPTool
module load geant4/10.07.00
source /mnt/misc/sw/x86_64/Debian/10/geant4/gnu/10.07.00/share/Geant4-10.7.0/geant4make/geant4make.sh
source /mnt/simulations/hira/Sam/nptool/nptool.sh
module load xerces/3.2.3

