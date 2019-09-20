#!/bin/bash
/bin/bash snap_xm.sh $1
/bin/bash send_telegram_photo.sh $1 "$2"
