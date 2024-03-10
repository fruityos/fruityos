echo Building yuzu...
cd yuzu/yuzu
./build.sh
cd ..
cd ..
echo Building fapld...
cd fapld/fapld
./build.sh
cd ..
cd ..
echo Building peel...
cd peel/peel
./build.sh
cd ..
cd ..
echo Building seed...
cd seed/seed
./build.sh
cd ..
cd ..
echo Building pulp...
cd pulp/pulp
./build.sh
cd ..
cd ..

echo Creating initial RAM filesystem...
rm -rf initrd
mkdir initrd
cd initrd
mkdir lib
mkdir bin
mkdir src
cp ../peel/peel/bin/* bin
cp ../peel/peel/lib/libpith.fap lib/libpith.asm
cp ../peel/peel/lib/_start.fap lib/_start.asm
../peel/peel/bin/jar.fap c initrd.jar
cd ..

cat seed/seed/bin/fdseed.bin pulp/pulp/bin/pulp.sys initrd/initrd.jar > fruityos.img
stat --printf="FruityOS size is %s bytes.\n" fruityos.img
truncate -s 1440K fruityos.img
