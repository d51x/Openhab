#!/bin/bash
RTSP="rtsp://192.168.2.10$1:554/user=admin&password=&channel=1&stream=0.sdp?Real_stream"
PART_TIME=$2  #20 sec
SNAP_FOLDER=/home/media/Snaps/Motion/
FILE=$SNAP_FOLDER"`date +%Y.%m.%d_%H.%M.%S`__camera0$1.mp4"
ffmpeg -rtsp_transport tcp -y -t $PART_TIME -i $RTSP -c:v copy -t $PART_TIME $FILE #> /dev/null 2>&1
exit 0

