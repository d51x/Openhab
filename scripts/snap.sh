#!/bin/bash
SNAP_URL="http://192.168.2.101/webcapture.jpg?command=snap&channel=1"
SNAP_FOLDER=/home/media/Snaps/

while true
do
    SNAP_YEAR="`date +%Y`"
    SNAP_MONTH="`date +%m`"
    SNAP_DAY="`date +%d`"

    SNAP_DIR="$SNAP_FOLDER$SNAP_YEAR/"
    if ! [ -d $SNAP_DIR ]; then
	mkdir $SNAP_DIR
    fi

    SNAP_DIR="$SNAP_DIR$SNAP_MONTH/"
    if ! [ -d $SNAP_DIR ]; then
	mkdir $SNAP_DIR
    fi
    
    SNAP_DIR="$SNAP_DIR$SNAP_DAY/"
    if ! [ -d $SNAP_DIR ]; then
	mkdir $SNAP_DIR
    fi

    SNAP_HOUR="`date +%H`"
    SNAP_DIR="$SNAP_DIR$SNAP_HOUR/"
    if ! [ -d $SNAP_DIR ]; then
	mkdir $SNAP_DIR
    fi

    TIMESTAMP="`date +%Y%m%d_%H%M%S`"
    SNAP_FILE="snap_$TIMESTAMP.jpg"
    wget $SNAP_URL -q -O $SNAP_DIR$SNAP_FILE
#use loc file


    sleep 5
done

	