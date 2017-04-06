set -e

usage() {
	echo "usage: pure-func (-l|-x)"
	exit 255
}

# ensure that we get exactly one argument
if [ -z "$1" ] || [ -n "$2" ]
then
	usage
fi

case $1 in
	'-l')
		echo "el"
		;;
	'-x')
		echo "ex"
		;;
	*)
		usage
		;;
esac

find . -name \*.c -print0 \
	| xargs -0 ctags -x \
	| awk '{print $3, "\t", $2, "\t", $1}' \
	| sort
#| cut -d' ' -f1,2,3 -s
