#!/bin/bash
#
# GNU Readline Library v6.2 
#


DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME%.*}.build"
mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"





if [ ! -d "readline-6.2" ]; then

	if [ ! -f "readline-6.2.tar.gz" ]; then
		rcheck curl -L -o "readline-6.2.tar.gz" "http://ftp.gnu.org/gnu/readline/readline-6.2.tar.gz"
	fi

	rcheck tar -xf "readline-6.2.tar.gz"

#	There are patches available for the various versions of libreadline. More could become available!	
#	Patch readline62-002.patch in particular fixes a build problem with Mac OS X 10.7 (Lion)
	for PATCH in  "readline62-001" "readline62-002" "readline62-003" "readline62-004"; do
		if [ ! -f "$PATCH" ]; then
			rcheck curl -L -o "$PATCH" "http://ftp.gnu.org/gnu/readline/readline-6.2-patches/${PATCH}"
		fi
		rcheck patch -d "readline-6.2" -p0 -i "../$PATCH"
	done
fi

rcheck cd "readline-6.2";

# Readline uses the '-arch_only' option which is unsupported by GNU GCC,
# however the Apple Compatibility Wrapper handles this option.
rcheck ./configure --prefix="/usr/local"

# Compile and install
rcheck make
rcheck sudo make install
