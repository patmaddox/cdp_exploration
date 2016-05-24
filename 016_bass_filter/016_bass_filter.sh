#!/usr/bin/env sh

source ../config.sh

freq=41.2034446141

synth wave 4 gen/osc.wav 48000 1 10 $freq -a0.2
filter variable 2 gen/osc.wav gen/filtered.wav 0.25 0.5 freq.brk
envel impose 3 gen/filtered.wav amp.brk gen/bass_finished.wav
paplay -i gen/bass_finished.wav
