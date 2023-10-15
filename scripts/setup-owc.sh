#!/bin/bash
mkdir -p /install/watcom
pushd /install/watcom
wget https://github.com/open-watcom/open-watcom-v2/releases/download/Current-build/open-watcom-2_0-c-linux-x64
chmod +x ./open-watcom-2_0-c-linux-x64
xterm -e './open-watcom-2_0-c-linux-x64 -s -i -dFullInstall=true'
echo 'export PATH=/usr/bin/watcom/binl64:$PATH' >> ~/.bashrc
export PATH=/usr/bin/watcom/binl64:$PATH
popd
rm -rf /install/watcom
