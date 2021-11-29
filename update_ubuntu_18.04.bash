#!/bin/sh
# build packages on ubuntu needed for R et al
sudo apt-get update && sudo apt-get install -y \
  build-essential \
  python-dev \
  git \
  nodejs \
  npm \
  gnome-tweak-tool \
  openjdk-8-jdk \
  python-pip \
  python-virtualenv \
  python-numpy \
  python-matplotlib \
  wget \
  cpio \
  iputils-ping \
  texinfo \
  gfortran \
  libreadline-dev \
  bzip2 \
  libbz2-dev \
  vim \
  lzma \
  liblzma-dev \
  libpcre3-dev \
  libcurl4-gnutls-dev \
  default-jre \
  default-jdk \
  nfs-common \
  libpng-dev \
  libcairo2-dev \
  libnetcdf-dev \
  libxml2-dev \
  libpango1.0-dev \
  pandoc \
  freeglut3-dev \
  libdatetime-perl \
  imagemagick-6.q16

# possibly need to do an upgrade and a reboot
# sudo apt-get upgrade
# sudo reboot
