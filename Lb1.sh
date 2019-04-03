#!/bin/bash

TMP='/tmp/errorfile'
mkdir -p $2

>$TMP
direction=$(realpath $2)
find "$3" -type f -name "*.$1" -exec ln {} $direction 2>$TMP ';'
while read LINE
do 
	echo "$(basename $0): $LINE">&2
done<$TMP
<$TMP


