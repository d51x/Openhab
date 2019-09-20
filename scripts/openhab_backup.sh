#!/bin/bash

SOURCE_FOLDER1="/etc/openhab2"
SOURCE_FOLDER2="/var/lib/openhab2/persistence/rrd4j"

BACKUP_FOLDER="/home/media/openhab_backup/"
TIMESTAMP="`date +%Y-%m-%d__%H_%M`"

echo $BACKUP_FOLDER$TIMESTAMP
mkdir $BACKUP_FOLDER$TIMESTAMP
cp -r $SOURCE_FOLDER1 $BACKUP_FOLDER$TIMESTAMP
cp -r $SOURCE_FOLDER2 $BACKUP_FOLDER$TIMESTAMP
