#!/usr/bin/env sh

source ../config.sh

freq=55
wavetype=4
synth wave $wavetype gen/osc.wav 48000 1 20 $freq -a0.2

modify stack gen/osc.wav gen/stacked.wav stack.brk 5 1 0 1 1
envel impose 3 gen/stacked.wav amp.brk gen/stacked_amped.wav

paplay -i gen/stacked_amped.wav
