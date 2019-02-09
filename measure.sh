#!/bin/sh -ue

if [ $# -ne 1 ] ; then
	echo "Usage: $0 FILENAME"
	exit 1
fi

FILENAME="$1"
BASEDIR=`dirname $0`

$BASEDIR/speedtest.py --secure --json > /tmp/measure.tmp
cat /tmp/measure.tmp > $FILENAME
