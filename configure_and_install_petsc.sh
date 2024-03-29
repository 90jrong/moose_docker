./configure \
--prefix=$PACKAGES_DIR/petsc-3.10.5 \
--download-hypre=1 \
--with-ssl=0 \
--with-debugging=no \
--with-pic=1 \
--with-shared-libraries=1 \
--with-cc=mpicc \
--with-cxx=mpicxx \
--with-fc=mpif90 \
--download-fblaslapack=1 \
--download-metis=1 \
--download-parmetis=1 \
--download-superlu_dist=1 \
--download-mumps=1 \
--download-scalapack=1 \
--with-cxx-dialect=C++11 \
--CC=mpicc --CXX=mpicxx --FC=mpif90 --F77=mpif77 --F90=mpif90 \
--CFLAGS='-fPIC -fopenmp' \
--CXXFLAGS='-fPIC -fopenmp' \
--FFLAGS='-fPIC -fopenmp' \
--FCFLAGS='-fPIC -fopenmp' \
--F90FLAGS='-fPIC -fopenmp' \
--F77FLAGS='-fPIC -fopenmp' \
PETSC_DIR=`pwd`

make PETSC_DIR=$STACK_SRC/petsc-3.10.5 PETSC_ARCH=arch-linux2-c-opt all
make PETSC_DIR=$STACK_SRC/petsc-3.10.5 PETSC_ARCH=arch-linux2-c-opt install


