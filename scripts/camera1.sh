#!/bin/bash
RTSP_URL="rtsp://192.168.2.101:554/user=admin&password=&channel=1&stream=0.sdp?Real_stream"
PART_TIME=20
SNAP_FOLDER=/home/media/Snaps/Camera01
FILENAME="Camera_01_%04d.mp4"

    if ! [ -d $SNAP_FOLDER ]; then
	mkdir $SNAP_FOLDER
    fi

ffmpeg -rtsp_transport tcp -i $RTSP_URL -c:v copy -map 0:0 -f segment -segment_time $PART_TIME -segment_format mp4 "$SNAP_FOLDER/$FILENAME"

	