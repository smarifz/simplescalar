#!/usr/bin/env bash

# Archives already extracted, this script should build simplescalar

# Install simpleutils
cd $IDIR/simpleutils-990811
./configure -host=$HOST -target=$TARGET -with-gnu-as -with-gnu-ld -prefix=$IDIR
make
make install


# Install simulator
cd $IDIR/simplesim-3.0
make config-pisa
make

# Build compiler
cd $IDIR/gcc-2.6.3
./configure -host=$HOST -target=$TARGET -with-gnu-as -with-gnu-ld --prefix=$IDIR 
make LANGUAGES=c
../simplesim-2.0/sim-safe ./enquire -f >! float.h-cross
make install


cd $IDIR/glibc-1.09
./configure --prefix=$IDIR/ssbig-na-sstrix ssbig-na-sstrix
unsetenv TZ
make
make install

# Test simulator
# ./sim-safe tests/bin.big/test-math
./sim-outorder tests/bin.big/test-math
