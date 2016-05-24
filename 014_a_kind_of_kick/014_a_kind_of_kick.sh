#!/usr/bin/env sh

source ../config.sh

synth wave 3 gen/triangle.wav 48000 1 10 44 -a0.2
modify speed 2 gen/triangle.wav gen/pitched.wav pitch.brk
envel impose 3 gen/pitched.wav amp.brk gen/pitched_and_amped.wav
paplay -i gen/pitched_and_amped.wav
