#!/usr/bin/env sh

# hey I never knew about this - sweet!
# exit the script if any errors happen
set -e

if [ ! -d gen ]; then
  mkdir gen
fi

rm -f gen/*
filter fixed 2 src/babbling_brook.wav gen/babbling_brook_low_pass.wav -36 4800
paplay -i gen/babbling_brook_low_pass.wav
