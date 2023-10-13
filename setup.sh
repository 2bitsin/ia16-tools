#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive
export DISPLAY=host.docker.internal:0.0 
apt update 
apt upgrade -y
apt install -y software-properties-common keyboard-configuration tilde mc nano wget sudo dosbox gcc-multilib g++-multilib build-essential binutils make autoconf bison flex texinfo git wget libncurses-dev dos2unix dejagnu autogen 
mkdir /home/setup && cd /home/setup
git clone --recursive https://gitlab.com/tkchia/build-ia16.git
cd /home/setup/build-ia16
./fetch.sh 
./build.sh clean
./build.sh binutils-debug
./build.sh binutils
./build.sh prereqs
./build.sh gcc1
./build.sh newlib
./build.sh causeway
./build.sh elks-libc
./build.sh elf2elks
./build.sh libi86
./build.sh gcc2
./build.sh extra
./build.sh sim
mv /home/setup/build-ia16/prefix /opt/ia16-elf-gcc
rm -rf /home/setup/*
echo 'export PATH=/opt/ia16-elf-gcc/bin:$PATH' >> ~/.bashrc 
export PATH=/opt/ia16-elf-gcc/bin:$PATH