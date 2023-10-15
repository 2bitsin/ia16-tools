mkdir -p /install/ia16-elf-gcc
pushd /install/ia16-elf-gcc
git clone --recursive https://gitlab.com/tkchia/build-ia16.git
pushd ./build-ia16
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
mv ./prefix /usr/bin/ia16-elf-gcc
echo 'export PATH=/usr/bin/ia16-elf-gcc/bin:$PATH' >> ~/.bashrc 
export PATH=/usr/bin/ia16-elf-gcc/bin:$PATH
popd
popd