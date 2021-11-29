#!/bin/bash
# create the topmed group
mgroup=m2gen
if ! compgen -g | grep $mgroup > /dev/null; then
    sudo groupadd --gid 1001 $mgroup
    # update ec2-user account (current login)
    sudo usermod -a -G $mgroup ec2-user
    sudo usermod -g $mgroup ec2-user
fi
# create user account
echo ">>> Creating m2gen user accounts  ..."

uaccnt=kulkara
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1003 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=kuraisar
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1004 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=santosh
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1006 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=zhangqi
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1007 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=hamidih
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1012 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=smithsean
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1013 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=mbotlani
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1014 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=zhijie
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1016 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=xuy
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1017 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=knamana
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1018 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=jjattansingh
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1020 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=karaiskos
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1019 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=lopezhoyo
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1021 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=ohampton
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1022 -g $mgroup -G docker -m  $uaccnt
fi

uaccnt=yin
if ! compgen -u | grep $uaccnt > /dev/null; then
    sudo useradd -d /home/$uaccnt -u 1024 -g $mgroup -G docker -m  $uaccnt
fi
