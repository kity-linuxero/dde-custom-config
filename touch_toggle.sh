#!/bin/bash

FILE=/tmp/touchpad.dde

if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "$FILE does not exist."
    echo 1 > $FILE
fi

VAR=`cat $FILE`

echo $VAR

if [[ "$VAR" -eq 1 ]]; then

    gsettings set com.deepin.dde.touchpad touchpad-enabled false
    notify-send "Touchpad switched OFF" -i touchpad-disabled-symbolic
    echo 0 > $FILE
else
   
    gsettings set com.deepin.dde.touchpad touchpad-enabled true
    notify-send "Touchpad switched ON" -i input-touchpad-symbolic
    echo 1 > $FILE

fi

