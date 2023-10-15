#!/bin/bash
set -e 
export DEBIAN_FRONTEND=noninteractive
./setup-pkg.sh
xvfb-run -a ./setup-owc.sh
xvfb-run -a ./setup-gcc16.sh