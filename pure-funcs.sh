set -e

find . -name \*.c -print0 \
	| xargs -0 ctags -x \
	| awk '{print $3, "\t", $2, "\t", $1}' \
	| sort
#| cut -d' ' -f1,2,3 -s
