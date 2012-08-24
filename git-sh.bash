#!/bin/bash
#
# git-sh (Git Shell)
#


DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME/%.bash/.build}"
mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"

if [ ! -d "git-sh" ]; then
	rcheck git clone git://github.com/rtomayko/git-sh.git
else 
	rcheck git pull origin master
fi

rcheck cd "git-sh"

rcheck make

rcheck sudo make install PREFIX="/usr/local"
