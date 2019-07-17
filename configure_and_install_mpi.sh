
../configure --prefix=$PACKAGES_DIR/mpich-3.3 \
--enable-shared \
--enable-sharedlibs=gcc \
--enable-fast=O2 \
--enable-debuginfo \
--enable-totalview \
--enable-two-level-namespace \
CC=gcc \
CXX=g++ \
FC=gfortran \
F77=gfortran \
F90='' \
CFLAGS='' \
CXXFLAGS='' \
FFLAGS='' \
FCFLAGS='' \
F90FLAGS='' \
F77FLAGS=''

make -j 12 # (where # is the number of cores available)

make install

