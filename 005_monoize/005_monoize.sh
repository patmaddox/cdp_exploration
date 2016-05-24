#!/usr/bin/env sh

source ../config.sh

housekeep chans 4 src/babbling_brook.wav gen/babbling_brook_mono.wav
pvoc anal 1 gen/babbling_brook_mono.wav gen/babbling_brook.ana
blur blur gen/babbling_brook.ana gen/babbling_brook_blurred.ana 86
pvoc synth gen/babbling_brook_blurred.ana gen/babbling_brook_blurred.wav
paplay -i gen/babbling_brook_blurred.wav
