#!/bin/bash
set -e 
export DEBIAN_FRONTEND=noninteractive
./setup-pkg.sh
xvfb-run -a /bin/bash -c ./setup-gcc16.sh
xvfb-run -a /bin/bash -c ./setup-owc.sh