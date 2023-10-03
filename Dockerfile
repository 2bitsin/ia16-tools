FROM ubuntu:latest
ENV DISPLAY=host.docker.internal:0.0 DEBIAN_FRONTEND=noninteractive
RUN useradd -ms /bin/bash setup
RUN apt update 
RUN apt upgrade -y
RUN apt install -y software-properties-common keyboard-configuration
#RUN add-apt-repository ppa:dosemu2/ppa
#RUN apt update
#RUN apt install -y dosemu2
RUN apt install -y wget dosbox gcc-multilib g++-multilib build-essential binutils make autoconf bison flex texinfo git wget libncurses-dev dos2unix dejagnu autogen 
USER setup
WORKDIR /home/setup
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
RUN ./build.sh libi86
RUN ./build.sh gcc2
RUN ./build.sh extra
RUN ./build.sh sim
RUN ./build.sh test


