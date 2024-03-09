sudo apt install nasm gcc gdb qemu-system-x86

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

echo Creating initial RAM filesystem...
mkdir initrd
cd initrd
mkdir lib
mkdir bin
cp ../peel/lib/libpith.fap lib/libpith.asm
cp ../peel/lib/_start.fap lib/_start.asm
cp ../peel/bin/* bin
cp -rp ../peel/src src
../peel/bin/jar.fap c initrd.jar
cd ..

cat seed/bin/fdseed.bin pulp/bin/pulp.sys initrd/initrd.jar > fruityos.img
stat --printf="FruityOS size is %s bytes.\n" fruityos.img
truncate -s 1440K fruityos.img

rm -rf initrd
