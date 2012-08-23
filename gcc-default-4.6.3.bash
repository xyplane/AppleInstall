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

rcheck sudo ln -sf  "cc-acw-4.6.3"    "/usr/local/bin/cc"
rcheck sudo ln -sf  "c++-acw-4.6.3"   "/usr/local/bin/c++"
rcheck sudo ln -sf  "gcc-acw-4.6.3"   "/usr/local/bin/gcc"
rcheck sudo ln -sf  "g++-acw-4.6.3"   "/usr/local/bin/g++"
rcheck sudo ln -sf  "cpp-4.6.3"       "/usr/local/bin/cpp"
rcheck sudo ln -sf  "gcov-4.6.3"      "/usr/local/bin/gcov"
rcheck sudo ln -sf  "gfortran-4.6.3"  "/usr/local/bin/gfortran"
