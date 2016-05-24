#!/usr/bin/env sh

source ../config.sh

synth wave 2 gen/square_c.wav 48000 1 6 261.6255653006 -a0.75
synth wave 3 gen/square_g.wav 48000 1 6 391.9954359817 -a0.75
submix balance gen/square_c.wav gen/square_g.wav gen/osc_mix.wav -k0.75
play gen/osc_mix.wav
