#!/bin/bash
#
# MPC 1.0 Library
#

DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME%.*}.build"
rcheck mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"

if [ ! -d "mpc-1.0" ]; then

	if [ ! -f "mpc-1.0.tar.gz" ]; then
		rcheck curl -L -o "mpc-1.0.tar.gz" "http://www.multiprecision.org/mpc/download/mpc-1.0.tar.gz"
	fi

	rcheck tar -xf "mpc-1.0.tar.gz"
fi


rcheck cd "mpc-1.0"

rcheck ./configure --prefix="/usr/local"

rcheck make
rcheck make check
rcheck sudo make install
