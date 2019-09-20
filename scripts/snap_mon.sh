#!/bin/bash

SRC="/home/media/Snaps/192*"

inotifywait -m -e close_write --format '%w %f' -r  $SRC  |\
(
while read
do
    # Получаем имя директории
    DIR=$(echo $REPLY | cut -f 1 -d' ')
    # Получаем имя файла
    FILE=$(echo $REPLY | cut -f 2 -d' ')
    # Передаем имена директории и файла в функцию
    #echo $DIR $FILE
    sh /home/pi/telegram_photo.sh $DIR $FILE  > /dev/null 2>&1
done
)
