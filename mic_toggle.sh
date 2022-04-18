#!/bin/bash

amixer set Capture toggle && amixer get Capture | grep '\[off\]' && notify-send "MIC switched OFF" -i audio-input-microphone-muted-symbolic || notify-send "MIC switched ON" -i audio-input-microphone-high-symbolic
