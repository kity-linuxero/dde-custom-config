#!/bin/bash

FILE=/tmp/touchpad.dde

if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "$FILE does not exist."
    echo 0 > $FILE
fi

VAR=`cat $FILE`

echo $VAR

# If file content is 1
if [[ "$VAR" -eq 1 ]]; then
    xinput set-prop 13 343 1
    gsettings set com.deepin.dde.touchpad touchpad-enabled false
    notify-send "Touchpad switched OFF" -i touchpad-disabled-symbolic
    echo 0 > $FILE
else
    gsettings set com.deepin.dde.touchpad touchpad-enabled true
    gsettings set com.deepin.dde.touchpad natural-scroll true
    notify-send "Touchpad switched ON" -i input-touchpad-symbolic
    xinput set-prop 13 343 0
    echo 1 > $FILE
fi

