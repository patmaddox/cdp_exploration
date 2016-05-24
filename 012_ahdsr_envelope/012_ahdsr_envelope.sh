#!/usr/bin/env sh

source ../config.sh

synth wave 4 gen/saw_a.wav 48000 1 10 220 -a0.2
envel impose 3 gen/saw_a.wav ahdsr.brk gen/enveloped.wav
paplay -i gen/enveloped.wav
