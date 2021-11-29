#!/bin/bash
# install Rstudio
#   arg1: Rstudio version
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

RS_VERSION=$1
# install RStudio
if [ ! -d /usr/local/src/rstudio ]; then
    sudo apt-get update
    sudo apt-get install -y gdebi-core net-tools
    mkdir /usr/local/src/rstudio
    cd /usr/local/src/rstudio
    wget https://download2.rstudio.org/rstudio-server-$RS_VERSION-amd64.deb
    sudo gdebi -n rstudio-server-$RS_VERSION-amd64.deb
else
    echo "RStudio Server already built"
fi
