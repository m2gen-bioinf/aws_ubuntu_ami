#!/bin/bash
# install docker
# see https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
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

if [ ! -f /usr/bin/docker ]; then
    sudo apt update && sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

    sudo apt update

# run the next interactively
# apt-cache policy docker-ce

    sudo apt install -y docker-ce
fi
# add docker group to all users
echo ">>> Adding docker group to all users"
uaccnt=ubuntu
dgrp=docker
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=cukrassc
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=kulkara
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=kuraisar
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=daihongy
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=santosh
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=zhangqi
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=madduxje
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=hamidih
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=smithsean
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=mbotlani
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=psebby
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=zhijie
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=xuy
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=knamana
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=karaiskos
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi

uaccnt=jjattansingh
if compgen -u | grep $uaccnt > /dev/null; then
    if ! groups $uaccnt | grep $dgrp > /dev/null; then
        sudo usermod -aG $dgrp $uaccnt
    fi
fi
