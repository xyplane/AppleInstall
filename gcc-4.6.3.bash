#!/bin/bash
#
# GNU GCC v4.6.3
#
# Warning: This script is untested!
#

DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME%.*}.build"
rcheck mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"


# Check for build requirements. GMP,MPC,etc

# if [ ! `which cc` == "/usr/local/bin/cc" ]; then
# 	echo "cc: GNU C compiler not found."
# 	exit 1
# fi

# if [ ! `which c++` == "/usr/local/bin/c++" ]; then 
# 	echo "c++: GNU C++ compiler not found."
# 	exit 1
# fi


if [ ! -d "gcc-4.6.3" ]; then

	if [ ! -f "gcc-4.6.3.tar.bz2" ]; then
		rcheck curl -L -o gcc-4.6.3.tar.bz2 http://gcc.parentingamerica.com/releases/gcc-4.6.3/gcc-4.6.3.tar.bz2
	fi

	rcheck tar -xf "gcc-4.6.3.tar.bz2"
fi

rcheck cd "gcc-4.6.3"


if [ ! -f "Makefile" ]; then
	rcheck ./configure --prefix="/usr/local" --program-suffix="-4.6.3" --enable-languages="c,c++,fortran"
fi

rcheck make
rcheck sudo make install
rcheck sudo ln -sf "gcc-4.6.3" "/usr/local/bin/cc-4.6.3"
	