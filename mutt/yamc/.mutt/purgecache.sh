#!/bin/sh

## In KB.
CACHE_LIMIT=51200

cd "$1" 2>/dev/null
[ $? -ne 0 ] && exit

[ $(du -s . | cut -f1 -d'	') -lt $CACHE_LIMIT ] && exit
while IFS= read -r i; do
	rm "$i"
	[ $(du -s . | cut -f1 -d'	') -lt $CACHE_LIMIT ] && exit
done <<EOF
$(find . -type f -exec ls -rt1 {} +)
EOF

