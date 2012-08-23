#!/bin/bash
#
# Setup GCC 4.6.3 as default.
#

DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


#BUILDNAME="${BASENAME/%.bash/.build}"
#rcheck mkdir -p "$DIRNAME/$BUILDNAME"
#rcheck cd "$DIRNAME/$BUILDNAME"

rcheck mkdir -p usr/local/bin
rcheck	ln -sf  "cc-acw-4.6.3"    "usr/local/bin/cc"
rcheck	ln -sf  "c++-acw-4.6.3"   "usr/local/bin/c++"
rcheck	ln -sf  "gcc-acw-4.6.3"   "usr/local/bin/gcc"
rcheck	ln -sf  "g++-acw-4.6.3"   "usr/local/bin/g++"
rcheck	ln -sf  "cpp-4.6.3"       "usr/local/bin/cpp"
rcheck	ln -sf  "gcov-4.6.3"      "usr/local/bin/gcov"
rcheck	ln -sf  "gfortran-4.6.3"  "usr/local/bin/gfortran"
