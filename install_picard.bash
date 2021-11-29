#!/bin/bash
# install picard
#   arg1: picard version
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
A_NAME=picard
P_VERSION=${1:-2.18.26}
SRC_DIR=/usr/local/src/$A_NAME

if [ ! -f /usr/local/$A_NAME-$P_VERSION ]; then
    echo "Building $A_NAME-$P_VERSION ..."
    # download picard
    if [ ! -d $SRC_DIR ]; then
        mkdir $SRC_DIR
    fi
    cd $SRC_DIR
    D_SRC=https://github.com/broadinstitute/picard/archive/$P_VERSION.tar.gz
    if [ ! -f $A_NAME-$P_VERSION.tar.gz ]; then
        echo ">>> Getting $D_SRC"
        wget --no-check-certificate --content-disposition $D_SRC
    fi
    if [ ! -d $A_NAME-$P_VERSION ]; then
        tar zxf $A_NAME-$P_VERSION.tar.gz
    fi

fi
