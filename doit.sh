#!/bin/bash -ue


echo "Delaying execution for 5 minutes..." 1>&2
sleep 5m

STAMP=`date "+%F_%T"`
BASEDIR=`dirname $0`
FILENAME=$BASEDIR/$STAMP.log
LOGFILE=$BASEDIR/speedtest.log


if ! $BASEDIR/measure.sh $FILENAME ; then
	echo "$BASEDIR/measure.sh failed with $?"
	exit 0
fi
$BASEDIR/append.sh $FILENAME $LOGFILE

scp -q $LOGFILE u16352@kkrach.de:kkrach.de/speedtest/

echo "Created $FILENAME"
