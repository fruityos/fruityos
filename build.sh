sudo apt install nasm gcc qemu-system-x86

git clone git@github.com:fruityos/pulp.git
git clone git@github.com:fruityos/yuzu.git
git clone git@github.com:fruityos/peel.git
git clone git@github.com:fruityos/fapld.git
git clone git@github.com:fruityos/seed.git

cd yuzu
./build.sh
cd ..
cd fapld
./build.sh
cd ..
cd peel
./build.sh
cd ..
cd seed
./build.sh
cd ..
cd pulp
./build.sh
cd ..

cat seed/bin/fdseed.bin pulp/bin/pulp.sys peel/peel.jar > fruityos.img
truncate -s 252K fruityos.img
gdb --command=debug.gdb
