#!/bin/bash
mkdir -p /install
pushd /install
git clone https://github.com/davidgiven/ack.git
pushd ./ack
make DEFAULT_PLATFORM=linux VERBOSE=1
make install
popd
rm -rf ./ack
popd