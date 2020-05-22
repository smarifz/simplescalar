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
# Test simulator
./sim-safe tests/bin.little/test-math

# ./sim-cache 