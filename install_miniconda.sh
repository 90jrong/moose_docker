PATH=$PACKAGES_DIR/miniconda/bin:$PATH conda config --set ssl_verify false
PATH=$PACKAGES_DIR/miniconda/bin:$PATH conda install -c idaholab python=2.7 coverage \
	reportlab \
	mako \
	numpy \
	scipy \
	scikit-learn \
	h5py \
	hdf5 \
	scikit-image \
	requests \
	vtk=7.1.0 \
	pyyaml \
	matplotlib \
	pip \
	lxml \
	pyflakes \
	pandas \
	conda-build \
	mock \
	yaml \
	pyqt \
	swig --yes

PATH=$PACKAGES_DIR/miniconda/bin:$PATH pip install --no-cache-dir pybtex livereload==2.5.1 daemonlite pylint==1.6.5 lxml pylatexenc anytree
