#
# Common variables and functions for Installation scripts.
#

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin


function rignore {
	echo "$@";
	"$@";
	return $?;
}


function rcheck {
	echo "$@";
	"$@";
	RET=$?;
	if [ ! $RET -eq 0 ]; then
		exit $RET;
	else
		return $RET;
	fi
}
