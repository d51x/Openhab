#!/bin/bash
RTSP="rtsp://192.168.2.10$1:554/user=admin&password=&channel=1&stream=0.sdp?Real_stream"
FILE="/tmp/Camera0$1.jpg"
ffmpeg  -rtsp_transport tcp -y -i $RTSP -vframes 1 $FILE > /dev/null 2>&1
