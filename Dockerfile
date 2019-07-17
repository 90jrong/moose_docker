FROM ubuntu:16.04

#build 

#run
# docker run -it -v ~/work/tmp:/mnt/src -v ~/work/:/mnt/work --net=host  -e DISPLAY=:10.0  -v $HOME/.Xauthority:/root/.Xauthority --rm  --name moose moose:v0

COPY sources.list /etc/apt/
COPY configure_and_install_mpi.sh mpi_env.sh install_miniconda.sh moose_env.sh /home/

VOLUME /mnt/src

# location to store src
ENV STACK_DIR=/mnt/src PACKAGES_DIR=/home/lib/packages

# install compiling env
RUN apt-get update && \
	apt-get install -y build-essential gfortran git && \
	apt-get install -y curl && \
	apt-get install -y cmake && \
	apt-get install -y m4 && \
	apt-get install -y x11-apps libglu1-mesa && \
    mkdir -p /home/lib && \
    mkdir -p $PACKAGES_DIR && \
	rm /bin/sh && ln -s /bin/bash /bin/sh

#apt-get install -y paraview && \

# install mpi
RUN cd $STACK_DIR && \
	curl -L -O http://www.mpich.org/static/downloads/3.3/mpich-3.3.tar.gz && \
	tar -xf mpich-3.3.tar.gz -C . && \
	mkdir $STACK_DIR/mpich-3.3/gcc-build && \
	cd $STACK_DIR/mpich-3.3/gcc-build && \
    chmod +x /home/configure_and_install_mpi.sh && \
	/home/configure_and_install_mpi.sh && \
	cd ../../ && \
	rm -rf mpich-3.3.tar.gz mpich-3.3

# Miniconda
RUN cd $STACK_DIR && \
	curl -L -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
	/bin/bash -c "source /home/mpi_env.sh" && \
	sh Miniconda2-latest-Linux-x86_64.sh -b -p $PACKAGES_DIR/miniconda && \
    chmod +x /home/install_miniconda.sh && \
	/home/install_miniconda.sh


# git moose
RUN cd $STACK_DIR && \
	git clone --depth=1 https://github.com/idaholab/moose.git && \
# petsc 
	cd $STACK_DIR/moose/scripts && \
	source /home/mpi_env.sh && \
	export PATH=$PACKAGES_DIR/miniconda/bin:$PATH && \
	./update_and_rebuild_petsc.sh --prefix=$PACKAGES_DIR/petsc-moose --COPTFLAGS='-g -O3' --CXXOPTFLAGS='-g -O3' --FOPTFLAGS='-g -O3' --download-ptscotch=0 && \
	cd $STACK_DIR/moose/petsc && \
	make PETSC_DIR=$STACK_DIR/moose/petsc PETSC_ARCH=arch-moose install && \
# install libmesh
	cd $STACK_DIR/moose/scripts && \
	source /home/moose_env.sh && \
	export MOOSE_JOBS=15 && \
	./update_and_rebuild_libmesh.sh --enable-march --with-gcc-arch=native && \

#remove all srcs
RUN cd $STACK_DIR && \
	rm -rf *
