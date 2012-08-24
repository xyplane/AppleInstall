#!/bin/bash
#
# GMP (GNU Multi-Precision) 5.0.5 Library
#

DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME%.*}.build"
rcheck mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"

if [ ! -d "gmp-5.0.5" ]; then

	if [ ! -f "gmp-5.0.5.tar.bz2" ]; then
		rcheck curl -L -o "gmp-5.0.5.tar.bz2" "ftp://ftp.gmplib.org/pub/gmp-5.0.5/gmp-5.0.5.tar.bz2"
	fi

	rcheck tar -xf "gmp-5.0.5.tar.bz2"
fi


rcheck cd "gmp-5.0.5"

rcheck ./configure --prefix="/usr/local"

rcheck make
rcheck make check
rcheck sudo make install
