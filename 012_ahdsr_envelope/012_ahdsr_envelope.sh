#!/usr/bin/env sh

source ../config.sh

synth wave 4 gen/saw_a.wav 48000 1 10 220 -a0.2
# envel impose  3  input_sndfile imposed-brkfile    outsndfile
envel impose 3 gen/saw_a.wav ahdsr.brk gen/enveloped.wav
# envel curtail 2 gen/saw_a.wav gen/saw_a_envel.wav 0.10 0.5 1
paplay -i gen/enveloped.wav
