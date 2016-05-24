#!/usr/bin/env sh

source ../config.sh

pvoc anal 1 ../001_basics/src/babbling_brook.wav gen/babbling_brook.ana
blur blur gen/babbling_brook.ana gen/babbling_brook_blurred.ana 18
pvoc synth gen/babbling_brook_blurred.ana gen/babbling_brook_blurred.wav
play gen/babbling_brook_blurred.wav
