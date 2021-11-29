#!/bin/bash
# install m2gen packages
#    optional arg1: R version
#    optional arg2: path of the m2gen R package libraries
# 0. handle argument
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

R_VERSION=${1:-3.6.1}
DEF_LIB_PATH=/ext_ebs/"$R_VERSION"_LIBRARY_m2gen
LIB_PATH=${2:-$DEF_LIB_PATH}
# 1. create a path to R library
echo "Setting lib path for m2gen R packages to $LIB_PATH"
if [ ! -d "$LIB_PATH" ]; then
    sudo mkdir -p "$LIB_PATH"
    sudo chown ubuntu $LIB_PATH
fi
# 2. call a python script to generate a script install m2gen packages
INSTALLSCRIPT="installm2gen.R"
R_HOME="/usr/local/R-$R_VERSION"
R_SCRIPT=$R_HOME/bin/Rscript
if [ -f $INSTALLSCRIPT ]; then
    rm $INSTALLSCRIPT
fi
python ./install_rpackages_m2gen.py "$LIB_PATH" -i "$INSTALLSCRIPT" -R "$R_SCRIPT"
if [ $? -eq 0 ]; then
    if [ -f $INSTALLSCRIPT ]; then
        echo "Installing m2gen packages ..."
        # if we need set R_LIBS_SITE
        if [ $DEF_LIB_PATH != $LIB_PATH ]; then
            site_fn="$R_HOME/lib/R/etc/Renviron.site"
            echo "R_LIBS_SITE=$LIB_PATH" > $site_fn
        fi
        # execute the script to install in site
        chmod +x "$INSTALLSCRIPT"
        ./"$INSTALLSCRIPT"
    else
        echo "m2gen packages already installed"
    fi
fi
