#!/bin/bash
#
# MPFR 3.1.1 Multiprecision Library
#

DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME%.*}.build"
rcheck mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"

if [ ! -d "mpfr-3.1.1" ]; then

	if [ ! -f "mpfr-3.1.1.tar.bz2" ]; then
		rcheck curl -L -o "mpfr-3.1.1.tar.bz2" "http://www.mpfr.org/mpfr-current/mpfr-3.1.1.tar.bz2"
	fi

	rcheck tar -xf "mpfr-3.1.1.tar.bz2"
fi


rcheck cd "mpfr-3.1.1"

rcheck ./configure --prefix="/usr/local"

rcheck make
rcheck sudo make install
