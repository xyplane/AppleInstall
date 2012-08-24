#!/bin/bash
#
# Perl 5.16.1 Scripting Lanuage
#

DIRNAME=`dirname "$0"`
BASENAME=`basename "$0"`
.  "$DIRNAME/common.bash"


BUILDNAME="${BASENAME%.*}.build"
rcheck mkdir -p "$DIRNAME/$BUILDNAME"
rcheck cd "$DIRNAME/$BUILDNAME"


if [ ! -d "perl-5.16.1" ]; then

	if [ ! -f "perl-5.16.1.tar.gz" ]; then
		rcheck curl -L -o "perl-5.16.1.tar.gz" "http://www.cpan.org/src/5.0/perl-5.16.1.tar.gz"
	fi

	rcheck tar -xf "perl-5.16.1.tar.gz"
fi


rcheck cd "perl-5.16.1"

rcheck sh Configure -de -Dprefix="/usr/local"

rcheck make
rcheck make test
rcheck sudo make install
