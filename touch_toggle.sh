#!/bin/bash

#xdotool key XF86TouchpadToggle

device=$(xinput | grep "ELAN1200:00 04F3:3044 Touchpad" | grep -Eo "id\=[0-9]{1,2}" |grep -Eo "[0-9]{1,2}")

state=$(xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$")

if [ $state == '1' ];then

  xinput --disable "$device"

else

  xinput --enable "$device"

fi
