#!/bin/bash
#/bin/bash /home/pi/snap.sh &		# screenshots
#/bin/bash /home/pi/camera.sh &		#video
/bin/bash /home/pi/camera2.sh > /dev/null 2>&1 &
/bin/bash /home/pi/camera3.sh > /dev/null 2>&1 &
	
