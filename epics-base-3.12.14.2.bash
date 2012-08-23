#!/bin/bash
#
# EPICS base v3.14.12.2
#

DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME%.*}.build"
rcheck mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"


# Check for build requirements.

if [ ! `which cc` == "/usr/local/bin/cc" ]; then
	echo "cc: GNU C compiler not found."
	exit 1
fi

if [ ! `which c++` == "/usr/local/bin/c++" ]; then 
	echo "c++: GNU C++ compiler not found."
	exit 1
fi

# EPICS uses 'perl' to determine build configuration,
# therefore a custom build version is required.

if [ ! `which perl` == "/usr/local/bin/perl" ]; then 
	echo "perl: Perl interpreter not found."
	exit 1
fi


if [ ! -d "base-3.14.12.2" ]; then

	if [ ! -f "baseR3.14.12.2.tar.gz" ]; then
		rcheck curl -L -o baseR3.14.12.2.tar.gz http://www.aps.anl.gov/epics/download/base/baseR3.14.12.2.tar.gz
	fi

	rcheck tar -xf "baseR3.14.12.2.tar.gz"
fi

rcheck cd "base-3.14.12.2"

# The default build architecture is 'x86' (ie darwin-x86) even on 64bit hardware.
# Force compilation for 64bit architecture using the configuration option 'ARCH_CLASS=x86_64'.
# The compliation of 'cap5' uses the perl installation to determine its compilation flags.
rcheck make ARCH_CLASS="x86_64" CC="/usr/local/bin/cc"  CCC="/usr/local/bin/c++" PERL="/usr/local/bin/perl"

rcheck sudo mkdir -p "/usr/local/epics/base-3.14.12.2"
rcheck sudo cp -Rf "bin" "lib" "dbd" "db" "/usr/local/epics/base-3.14.12.2"

rcheck cd "/usr/local/bin"
find "../epics/base-3.14.12.2/bin/darwin-x86" | xargs -t -n1 sudo ln -sf

rcheck cd "/usr/local/lib"
find "../epics/base-3.14.12.2/lib/darwin-x86" | xargs -t -n1 sudo ln -sf

rcheck cd "/usr/local"
rcheck sudo ln -sf "epics/base-3.14.12.2/dbd"

rcheck cd "/usr/local" 
rcheck sudo ln -sf "epics/base-3.14.12.2/db"
