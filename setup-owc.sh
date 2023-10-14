set -e
export DEBIAN_FRONTEND=noninteractive
export DISPLAY=host.docker.internal:0.0
apt update && apt upgrade -y
apt install -y wget xterm
mkdir -p /home/setup/watcom
cd /home/setup/watcom
wget https://github.com/open-watcom/open-watcom-v2/releases/download/Current-build/open-watcom-2_0-c-linux-x64
chmod +x ./open-watcom-2_0-c-linux-x64
xterm -e "./open-watcom-2_0-c-linux-x64 -s -i -dFullInstall=true"
