#!/bin/bash
RTSP="rtsp://192.168.2.102:554/user=admin&password=&channel=1&stream=0.sdp?Real_stream"
FILE="/tmp/Camera02.jpg"

#ffmpeg -ss 2 -i "$RTSP_URL--rtp-caching=100" -y -f image2 -q:v 0 -frames 1 $FILENAME > /dev/null
ffmpeg  -rtsp_transport tcp -y -i $RTSP -vframes 1 $FILE > /dev/null 2>&1
