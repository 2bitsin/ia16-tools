FROM ubuntu:latest
WORKDIR /home/setup
RUN apt update 
RUN apt upgrade -y
RUN apt install -y wget
RUN wget https://bugs.launchpad.net/ubuntu/+source/dosemu/+bug/1975420/+attachment/5607345/+files/dosemu_1.4.0+svn.2080-1_amd64.deb -O dosemu.deb
RUN apt install -y $(dpkg-deb -f dosemu.deb Depends | sed 's/([^)]*)//g' | sed 's/,//g')
RUN dpkg -i dosemu.deb
RUN apt install -y dosbox gcc-multilib g++-multilib build-essential binutils make autoconf bison flex texinfo git wget libncurses-dev dos2unix
RUN git clone --recursive https://gitlab.com/tkchia/build-ia16.git
WORKDIR /home/setup/build-ia16
RUN ./fetch.sh 
RUN ./build.sh clean
RUN ./build.sh binutils-debug
RUN ./build.sh binutils
RUN ./build.sh prereqs
RUN ./build.sh gcc1
RUN ./build.sh newlib
RUN ./build.sh causeway
RUN ./build.sh elks-libc
RUN ./build.sh elf2elks
ENV DISPLAY=host.docker.internal:0.0
#RUN ./build.sh libi86 || true


