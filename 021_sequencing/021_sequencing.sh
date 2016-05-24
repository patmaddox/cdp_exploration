#!/usr/bin/env sh

source ../config.sh

# create kick drum
synth wave 3 gen/triangle.wav 48000 1 10 44 -a0.2
modify speed 2 gen/triangle.wav gen/pitched.wav pitch.brk
envel impose 3 gen/pitched.wav amp.brk gen/pitched_and_amped.wav

extend sequence gen/pitched_and_amped.wav gen/sequence.wav sequence.txt 1
silend silend 2 gen/sequence.wav gen/sequence_full_length.wav 1.6

# play it
paplay -i gen/sequence_full_length.wav
