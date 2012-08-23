#!/bin/bash
#
# Node JS v0.8.8 
#


DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME/%.bash/.build}"
mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"


# Check for build requirements.

if [ ! `which gcc` == "/usr/local/bin/gcc" ]; then
	echo "gcc: GNU C compiler not found."
	exit 1
fi

if [ ! `which g++` == "/usr/local/bin/g++" ]; then 
	echo "g++: GNU C++ compiler not found."
	exit 1
fi

# Node.js uses a WAF/GYP build systems,
# both require python to be installed.

if [ ! `which python` == "/usr/local/bin/python" ]; then 
	echo "python: Python interpreter not found."
	exit 1
fi


if [ ! -d "node-v0.8.8" ]; then

	if [ ! -f "node-v0.8.8.tar.gz" ]; then
		rcheck curl -L -o node-v0.8.8.tar.gz http://nodejs.org/dist/v0.8.8/node-v0.8.8.tar.gz
	fi

	rcheck tar -xf "node-v0.8.8.tar.gz"
fi

rcheck cd "node-v0.8.8"

if [ ! -f "config.mk" ]; then
	rcheck ./configure --prefix="/usr/local"
fi

# Now actually do the build and installation 

rcheck make

rcheck sudo make install

