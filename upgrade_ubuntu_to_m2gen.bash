#!/bin/bash
# upgrade a base ubuntu to have the following:
#1. Ubuntu server with appropriate security and ssh access
#2. Ubuntu packages supporting:
#    a. Developers (e.g., gcc)
#    b. R and various R packages
#    c. HPC (e.g., hdf5, openmpi)
#3. Intel's MKL
#4. Base R
#5. m2gen Specific Support
#    a. OpenCPU
#    b. install dx-toolkit
#    c. R packages
#    d. dx toolkit
#    e. aws cli
#    d. other tools
#6. User accounts in m2gen group
#7. RStudio server
#
# arg1: R version
f () {
    errcode=$? # save the exit code as the first thing done in the trap function
    echo "error $errorcode"
    echo "the command executing at the time of the error was"
    echo "$BASH_COMMAND"
    echo "on line ${BASH_LINENO[0]}"
    # do some error handling, cleanup, logging, notification
    # $BASH_COMMAND contains the command that was being executed at the time of the trap
    # ${BASH_LINENO[0]} contains the line number in the script of that command
    # exit the script or return to try again, etc.
    exit $errcode  # or use some other value or do return instead
}
trap f ERR
R_VERSION=${1:-3.5.1}
echo ">>> Upgrading Ubuntu to m2gen configure for R $R_VERSION ..."
# update basic ubuntu
echo ">>> Update Ubuntu packages ..."
./update_ubuntu_18.04.bash > update_ubuntu.log 2>&1

echo ">>> Update Ubuntu with hpc packages ..."
./install_ubuntu_hpc.bash > update_ubuntu_hpc.log 2>&1

echo ">>> Installing R $R_VERSION ..."
./install_R.bash $R_VERSION > install_r.log 2>&1
# install opencpu and Rstudio server
#if ! apt list | grep opencpu | grep install > /dev/null; then
#    echo ">>> Install OpenCPU server  ..."
#    sudo add-apt-repository -y ppa:opencpu/opencpu-2.0
#    sudo apt-get update
#    sudo apt-get upgrade
#    # Installs OpenCPU server
#    sudo apt-get install -y opencpu-server
#fi
# Install rstudio
RS_VERSION=1.1.463
echo ">>> Install RStudio server  ..."
./install_rstudio.bash $RS_VERSION > install_rstudio.log 2>&1

# install m2gen R packages
echo ">>> Installing m2gen R packages ..."
./install_rpackages_m2gen.bash $R_VERSION > install_r_m2gen.log 2>&1

# install dx toolkit
echo ">>> Installing dx toolkit ..."
./install_dxtoolkit.bash > install_dxtoolkit.log 2>&1

# install aws cli
echo ">>> Installing aws cli ..."
./install_awscli.bash > install_awscli.log 2>&1

# install picard
echo ">>> Installing picard ..."
./install_picard.bash > install_picard.log 2>&1

# install other apps
echo ">>> Installing other apps ..."
./install_otherapps.bash > install_apps.log 2>&1

# other notes
# 1. mount the ebs data disk (6TB or larger) as nfs client in /etc/rc.local
mpoint=/ext_ebs
exppoint=/export_ebs
echo "Mounting nfs data $exppoint to $mpoint ..."
if [ ! -d $mpoint ]; then
    sudo mkdir $mpoint
fi
sudo mount -t nfs4  -o vers=4.1  172.31.5.212:$exppoint $mpoint
echo "Modifying /etc/rc.local to mount nfs volume ..."
mpoint=/ext_ebs
if [ ! -d $mpoint ]; then
    sudo mkdir $mpoint
fi
# 2. update /etc/rc.local to mount NFS volumes
echo '#!/bin/sh -e' > rc.local
echo '#' >> rc.local
echo '# rc.local' >> rc.local
echo '# ' >> rc.local
echo '# mount nfs data volume' >> rc.local
#echo mount -t nfs4 -o vers=4.1 $PROJ_IP /projects >> rc.local
echo mount -t nfs4  -o vers=4.1  172.31.5.212:$exppoint $mpoint >> rc.local
echo exit 0 >> rc.local
chmod +x rc.local
sudo cp rc.local /etc/rc.local
# 3. create links from / to /ext_ebs
echo "Creating links to mount volume $mpoint ..."
ldir=/data
if [ -d "$ldir" ]; then
    sudo unlink $ldir
fi
sudo ln -s $mpoint$ldir $ldir
ldir=/bioinformatics
if [ -L "$ldir" ] && [ -d "$ldir" ]; then
    sudo unlink $ldir
fi
sudo ln -s $mpoint$ldir $ldir
ldir=/R_USERS_LIB
if [ -L "$ldir" ] && [ -d "$ldir" ]; then
    sudo unlink $ldir
fi
sudo ln -s $mpoint$ldir $ldir
ldir=/R_USERS_LIB_351
if [ -L "$ldir" ] && [ -d "$ldir" ]; then
    sudo unlink $ldir
fi
sudo ln -s $mpoint$ldir $ldir
ldir=/work
if [ -L "$ldir" ] && [ -d "$ldir" ]; then
    sudo unlink $ldir
fi
sudo ln -s $mpoint$ldir $ldir
ldir=/scratch
if [ -L "$ldir" ] && [ -d "$ldir" ]; then
    sudo unlink $ldir
fi
sudo ln -s $mpoint/mnt $ldir
# 3. for R,
#       a. insure that there is no valid R_USERS_LIB in $RHOME/etc/Renviron
#       b. create $RHOME/etc/Rprofile.site containing:
#           .libPaths(c(paste("/R_USERS_LIB/",Sys.getenv("USER"),"/",sep=""),.libPaths()))
#

# add user accounts
#echo ">>> Adding user accounts ..."
#./update_ubuntu_accounts.bash > update_accounts.log 2>&1
