#!/bin/bash
# upgrade python
#   arg1: version
#   arg2: install location
P_NAME="python"
P_VERSION=${1:-2.7.13}
P_FNAME=${P_NAME^}"-"$P_VERSION
T_NAME=$P_FNAME.tgz
P_SRC=https://www.python.org/ftp/$P_NAME/$P_VERSION/$T_NAME
I_ROOT=/usr/src
P_INSTALL=$I_ROOT/$P_FNAME
# check if version has been installed
if [ ! -d $P_INSTALL ]; then
    echo "Updating $P_FNAME ..."
    cd $I_ROOT
    sudo wget $P_SRC
    sudo tar xzf $T_NAME
    cd $P_FNAME
    sudo ./configure
    sudo make install
    sudo make altinstall
else
    echo "$P_FNAME is already installed"
fi
# install python modules
sudo pip install pyfaidx
sudo pip install fasteners
