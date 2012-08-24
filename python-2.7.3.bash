#!/bin/bash
#
# Python 2.7.3 Scripting Language
#

DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME%.*}.build"
rcheck mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"

if [ ! -d "Python-2.7.3" ]; then

	if [ ! -f "Python-2.7.3.tar.bz2" ]; then
		rcheck curl -L -o "Python-2.7.3.tar.bz2" "http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2"
	fi

	rcheck tar -xf "Python-2.7.3.tar.bz2"
fi


rcheck cd "Python-2.7.3"

rcheck ./configure --prefix="/usr/local"

rcheck make
rcheck sudo make install

