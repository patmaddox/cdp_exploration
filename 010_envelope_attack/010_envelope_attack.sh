#!/usr/bin/env sh

source ../config.sh

synth wave 4 gen/saw_a.wav 48000 1 3 110 -a0.05
envel attack 3 gen/saw_a.wav gen/saw_a_envel.wav 0 10 5 400
paplay -i gen/saw_a_envel.wav
