#!/bin/bash
#
# Julia (Bleeding Edge) Numerical Computing Language
#

DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME%.*}.build"
rcheck mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"

if [ ! -d "julia" ]; then
	rcheck git clone "git://github.com/JuliaLang/julia.git"
else 
	rcheck git pull origin master
fi


# Julia using LLVM which is the default compiler on Mac OS X,
# so needed to restore PATH to default for compiling Julia.
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin"

rcheck cd "julia"

rcheck make

COMMIT=`git log -n1 --format='%h'`
rcheck sudo cp -Rf "./usr" "/usr/local/julia-$COMMIT"
rcheck sudo ln -sf "../julia-$COMMIT/bin/julia-release-readline" "/usr/local/bin/julia"
