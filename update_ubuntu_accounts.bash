#!/bin/bash
# create the user accounts
echo ">>> Adding m2gen group ..."
# create the m2gen group
mgrp=m2gen
if ! compgen -g | grep $mgrp > /dev/null; then
    sudo addgroup $mgrp
    # update ubuntu account (current login)
    sudo usermod -a -G $mgrp ubuntu
    sudo usermod -g $mgrp ubuntu
fi

# create user account
echo ">>> Creating m2gen user accounts  ..."
uaccnt=cukrassc
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1002 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=kulkara
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1003 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=kuraisar
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1004 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=daihongy
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1005 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=santosh
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1006 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=zhangqi
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1007 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=madduxje
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1008 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=hamidih
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1012 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=smithsean
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1013 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=mbotlani
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1014 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=psebby
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1015 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=zhijie
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1016 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=xuy
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1017 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=knamana
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1018 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=karaiskos
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1019 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=jjattansingh
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1020 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=lopezhoyo
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1021 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=ohampton
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1022 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=palmer
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1023 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi

uaccnt=yin
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo adduser --ingroup $mgrp --uid 1024 --disabled-password --gecos GECOS $uaccnt
    sudo adduser $uaccnt sudo
    sudo usermod -a -G rstudio-server $uaccnt
    echo "$uaccnt:$uaccnt" | sudo chpasswd
fi
