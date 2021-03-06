#!/bin/bash
# install hdf5, openmpi, etc
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

sudo apt-get update && sudo apt-get install -y \
  mpich \
  hdf5-helpers \
  hdf5-tools \
  libhdf5-100 \
  libhdf5-cpp-100 \
  libhdf5-dev \
  libhdf5-doc \
  libopenmpi-dev \
  libopenmpi2 \
  openmpi-doc

MKL=l_mkl_2018.1.163
# mkl
if [ ! -f /etc/ld.so.conf.d/mkl_intel64.conf ]; then
    sudo chown -R ubuntu /usr/local
    if [ ! -d /usr/local/src/mkl ]; then
       mkdir /usr/local/src/mkl
    fi
    if [ ! -f /usr/local/src/mkl/$MKL.tgz ]; then
       cp ./$MKL.tgz /usr/local/src/mkl
    fi
    echo ">>> building mkl ... "
    cd /usr/local/src/mkl
    if [ ! -d $MKL ]; then
       tar -xzvf $MKL.tgz
    fi

    cd /usr/local/src/mkl/$MKL
    sed 's/ACCEPT_EULA=decline/ACCEPT_EULA=accept/g' silent.cfg > silent_build.cfg
    sudo ./install.sh --silent ./silent_build.cfg

    echo "/opt/intel/mkl/lib/intel64" > mkl.conf
    sudo cp ./mkl.conf /etc/ld.so.conf.d/mkl_intel64.conf
    sudo ldconfig
else
    echo "mkl already built"
fi
