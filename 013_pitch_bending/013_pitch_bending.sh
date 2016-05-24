#!/usr/bin/env sh

source ../config.sh

synth wave 4 gen/saw_a.wav 48000 1 20 220 -a0.2
modify speed 2 gen/saw_a.wav gen/bent.wav pitch.brk
paplay -i gen/bent.wav
