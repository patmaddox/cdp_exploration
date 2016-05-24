#!/usr/bin/env sh

source ../config.sh

pvoc anal 1 ../001_basics/src/babbling_brook.wav gen/babbling_brook.ana
blur blur gen/babbling_brook.ana gen/babbling_brook_blurred.ana 18
pvoc synth gen/babbling_brook_blurred.ana gen/babbling_brook_blurred.wav

filter variable 2 gen/babbling_brook_blurred.wav gen/filtered.wav 0.25 0.5 freq.brk
envel impose 3 gen/filtered.wav amp.brk gen/enveloped.wav

reverb gen/enveloped.wav gen/verby.wav 0.8 0 4 0.6 4000 5

paplay -i gen/verby.wav
