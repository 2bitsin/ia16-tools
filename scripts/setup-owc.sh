#!/bin/bash
mkdir -p /install/watcom
pushd /install/watcom
cp /install/scripts/options.ini /install/watcom
wget https://github.com/open-watcom/open-watcom-v2/releases/download/Current-build/open-watcom-2_0-c-linux-x64
chmod +x ./open-watcom-2_0-c-linux-x64
xterm -e './open-watcom-2_0-c-linux-x64 -f=options.ini -dFullInstall=1 -dSelectiveInstall=0 -dDstDir=/usr/bin/watcom -s -i'
echo 'export WATCOM=/usr/bin/watcom' >> ~/.bashrc
echo 'export PATH=$WATCOM/binl64:$PATH' >> ~/.bashrc
export WATCOM=/usr/bin/watcom
export PATH=$WATCOM/binl64:$PATH
popd
rm -rf /install/watcom
