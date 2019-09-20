#!/bin/bash
RTSP="rtsp://192.168.2.102:554/user=admin&password=&channel=1&stream=0.sdp?Real_stream"
PART_TIME=120  #2 min
SNAP_FOLDER=/home/media/Snaps/Camera02/

SNAP_YEAR="`date +%Y`"
SNAP_MONTH="`date +%m`"
SNAP_DAY="`date +%d`"
SNAP_HOUR="`date +%H`"
SNAP_MIN="`date +%M`"

SNAP_FOLDER="$SNAP_FOLDER$SNAP_YEAR/"
if ! [ -d $SNAP_FOLDER ]; then
	mkdir $SNAP_FOLDER
fi

SNAP_FOLDER="$SNAP_FOLDER$SNAP_MONTH/"
if ! [ -d $SNAP_FOLDER ]; then
	mkdir $SNAP_FOLDER
fi

SNAP_FOLDER="$SNAP_FOLDER$SNAP_DAY/"
if ! [ -d $SNAP_FOLDER ]; then
	mkdir $SNAP_FOLDER
fi

FILE=$SNAP_FOLDER"Camera_02__"$SNAP_HOUR"_"$SNAP_MIN"__%04d.mp4"
ffmpeg -re -i $RTSP -c:v copy -map 0:0 -f segment -segment_time $PART_TIME -segment_format mp4 "$FILE"
