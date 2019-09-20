#!/bin/bash
URL="http://192.168.2.101/webcapture.jpg?command=snap&channel=1"
FILE="/tmp/Camera01.jpg"
wget $URL -q -O $FILE > /dev/null 2>&1
