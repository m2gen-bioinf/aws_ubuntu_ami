#!/bin/bash
# install other apps
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
echo "Installing various apps ..."

APP_BSRC=/usr/local/src
APP_BBIN=/usr/local/bin
# sam tools
THE_APP=htslib
if [ ! -f /usr/local/lib/libhts.a ]; then
    echo ">>> Installing $THE_APP ..."
    if [ -d $APP_BSRC/$THE_APP ]; then
        echo "ERROR: $APP_BSRC/$THE_APP exists"
        exit 2
    fi
    cd $APP_BSRC
    sudo git clone --branch=develop git://github.com/samtools/$THE_APP.git
    cd $THE_APP
    sudo autoheader
    sudo autoconf
    sudo ./configure
    sudo make
    sudo make install
else
    echo "$THE_APP is already installed."
fi

# bcftools
THE_APP=bcftools
if ! which $THE_APP | grep $THE_APP > /dev/null; then
    echo ">>> Installing $THE_APP ..."
    if [ -d $APP_BSRC/$THE_APP ]; then
        echo "ERROR: $APP_BSRC/$THE_APP exists"
        exit 2
    fi
    cd $APP_BSRC
    sudo git clone --branch=develop git://github.com/samtools/$THE_APP.git
    cd $THE_APP
    sudo autoheader
    sudo autoconf
    sudo ./configure
    sudo make
    sudo make install
else
    echo "$THE_APP is already installed."
fi

# sam tools
THE_APP=samtools
if ! which $THE_APP | grep $THE_APP > /dev/null; then
    echo ">>> Installing $THE_APP ..."
    if [ -d $APP_BSRC/$THE_APP ]; then
        echo "ERROR: $APP_BSRC/$THE_APP exists"
        exit 2
    fi
    cd $APP_BSRC
    sudo git clone --branch=develop git://github.com/samtools/$THE_APP.git
    cd $THE_APP
    sudo autoheader
    sudo autoconf
    sudo ./configure
    sudo make
    sudo make install
else
    echo "$THE_APP is already installed."
fi
# bwa
THE_APP=bwa
if ! which $THE_APP | grep $THE_APP > /dev/null; then
    echo ">>> Installing $THE_APP ... "
    sudo apt-get update && sudo apt-get install -y $THE_APP
else
    echo ">>> $THE_APP is already installed."
fi
#
THE_APP=bowtie2
if ! which $THE_APP | grep $THE_APP > /dev/null; then
    echo ">>> Installing $THE_APP ... "
    sudo apt-get update && sudo apt-get install -y $THE_APP
else
    echo ">>> $THE_APP is already installed."
fi
#
THE_APP=tophat
if ! which $THE_APP | grep $THE_APP > /dev/null; then
    echo ">>> Installing $THE_APP ... "
    sudo apt-get update && sudo apt-get install -y $THE_APP
else
    echo ">>> $THE_APP is already installed."
fi
#
THE_APP=vcftools
if ! which $THE_APP | grep $THE_APP > /dev/null; then
    echo ">>> Installing $THE_APP ... "
    sudo apt-get update && sudo apt-get install -y $THE_APP
else
    echo ">>> $THE_APP is already installed."
fi
#
THE_APP=plink
if ! which $THE_APP | grep $THE_APP > /dev/null; then
    echo ">>> Installing $THE_APP ... "
    sudo apt-get update && sudo apt-get install -y $THE_APP
else
    echo ">>> $THE_APP is already installed."
fi
#
THE_APP=ensembl-vep
THE_VEP=vep
if ! which $THE_VEP | grep $THE_VEP > /dev/null; then
    echo ">>> Installing $THE_APP ... "
    if [ -d $APP_BSRC/$THE_APP ]; then
        echo "ERROR: $APP_BSRC/$THE_APP exists"
        exit 2
    fi
    cd $APP_BSRC
    sudo git clone https://github.com/Ensembl/$THE_APP.git
    cd $THE_APP
    sudo apt-get update && sudo apt-get install -y libgd-dev
    sudo apt-get update && sudo apt-get install -y unzip
    sudo apt-get update && sudo apt-get install -y libdbi-perl
    # check the Module::Build is installed
    # run this interactively: sudo cpan App::cpanminus
    sudo cpan App::cpanminus
    sudo cpanm Module::Build
    sudo cpanm --force XML::DOM::XPath
    sudo cpanm Bio::Root::Version
    sudo cpanm DBI
    sudo perl INSTALL.pl -a a
    sudo ln -s $APP_BSRC/$THE_APP/vep /usr/local/bin/vep
    sudo ln -s $APP_BSRC/$THE_APP/haplo /usr/local/bin/haplo
else
    echo ">>> $THE_APP is already installed."
fi
# python modules
sudo -H pip install HTSeq --upgrade
sudo -H pip install fasteners --upgrade

# install jupyter
#sudo apt-get update && sudo apt install -y x11-apps
#sudo apt-get install -y dbus-x11
#sudo add-apt-repository ppa:mozillateam/firefox-next
#sudo apt-get install -y firefox
#sudo apt-get update && sudo apt-get install -y python3-pip
#sudo python3.5 -m pip install --upgrade pip
#sudo python3.5 -m pip install jupyter
