#!/usr/bin/env sh

source ../config.sh

synth wave 1 gen/sine_c.wav 48000 1 6 261.6255653006 -a0.75
synth wave 1 gen/sine_g.wav 48000 1 6 391.9954359817 -a0.75
submix merge gen/sine_c.wav gen/sine_g.wav gen/osc_mix.wav
paplay -i gen/osc_mix.wav
