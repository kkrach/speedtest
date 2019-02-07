#!/bin/bash -xue

STAMP=`date "+%F_%T"`
BASEDIR=`dirname $0`
FILENAME=$BASEDIR/$STAMP.log
LOGFILE=$BASEDIR/speedtest.log


$BASEDIR/measure.sh $FILENAME
$BASEDIR/append.sh $FILENAME $LOGFILE

scp -q $LOGFILE u16352@kkrach.de:kkrach.de/speedtest/

echo "Created $FILENAME"
