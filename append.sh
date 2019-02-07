#!/bin/sh -ue

if [ $# -ne 2 ] ; then
	echo "Usage: $0 INPUT OUTPUT"
	exit 1
fi

INPUT="$1"
OUTPUT="$2"

DATE=`jq --raw-output .timestamp $INPUT`
UPLOAD=`jq .upload $INPUT`
DOWNLOAD=`jq .download $INPUT`

if [ ! -e $OUTPUT ] ; then
	echo "date,upload,download" > $OUTPUT
fi
echo "$DATE,$UPLOAD,$DOWNLOAD" >> $OUTPUT
