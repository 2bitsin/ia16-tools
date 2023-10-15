#!/bin/bash
set -e
apt update 
apt upgrade -y
apt install -y xvfb xterm software-properties-common keyboard-configuration   \
  tilde mc nano wget sudo dosbox gcc-multilib g++-multilib build-essential    \
  binutils make autoconf bison flex texinfo git wget libncurses-dev dos2unix  \
  dejagnu autogen 
