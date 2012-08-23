#!/bin/bash
#
# GCC ACW (gcc-4.6.3)
#

DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME/%.bash/.build}"
rcheck mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"


if [ ! -d "gcc-acw" ]; then
	rcheck git clone -b "gcc-4.6.3" "git@github.com:xyplane/gcc-acw.git"
fi

rcheck cd "gcc-acw"

rcheck sudo cp -f "gcc-acw" "/usr/local/bin/gcc-acw-4.6.3"
rcheck sudo cp -f "g++-acw" "/usr/local/bin/g++-acw-4.6.3"
rcheck sudo ln -sf "gcc-acw-4.6.3" "/usr/local/bin/cc-acw-4.6.3"
rcheck sudo ln -fs "g++-acw-4.6.3" "/usr/local/bin/c++-acw-4.6.3"
