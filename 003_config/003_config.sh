#!/usr/bin/env sh

source ../config.sh

filter fixed 3 ../001_basics/src/babbling_brook.wav gen/babbling_brook_notch.wav 175 -36 3200
paplay -i gen/babbling_brook_notch.wav
