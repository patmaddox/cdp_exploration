#!/usr/bin/env sh

source ../config.sh

synth wave 4 gen/saw_a.wav 48000 1 3 220 -a0.2
envel curtail 2 gen/saw_a.wav gen/saw_a_envel.wav 0.10 0.5 1
play gen/saw_a_envel.wav
