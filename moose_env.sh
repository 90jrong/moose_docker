#!/bin/bash
### MOOSE Environment Profile
# GCC default
# MPICH 3.3
# PETSc 3.10.5

#export PACKAGES_DIR=<what ever you exported initially during the Environment setup>

export PATH=$PACKAGES_DIR/mpich-3.3/bin:$PACKAGES_DIR/miniconda/bin:$PATH
export LD_LIBRARY_PATH=$PACKAGES_DIR/mpich-3.3/lib:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=$PACKAGES_DIR/mpich-3.3/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$PACKAGES_DIR/mpich-3.3/include:$CPLUS_INCLUDE_PATH
export FPATH=$PACKAGES_DIR/mpich-3.3/include:$FPATH
export MANPATH=$PACKAGES_DIR/mpich-3.3/share/man:$MANPATH
export PETSC_DIR=$PACKAGES_DIR/petsc-moose
export CC=mpicc
export CXX=mpicxx
export FC=mpif90
export F90=mpif90
export LIBMESH_DIR=$PACKAGES_DIR/libmesh-moose
export VTKLIB_DIR=$PACKAGES_DIR/miniconda/lib
export VTKINCLUDE_DIR=$PACKAGES_DIR/miniconda/include/vtk-7.1
