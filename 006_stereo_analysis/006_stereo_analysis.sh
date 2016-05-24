#!/usr/bin/env sh

source ../config.sh

# copy the src file into our gen, because housekeep chans creates the channel
# files in the same dir as the infile
cp ../005_monoize/src/babbling_brook.wav gen/
housekeep chans 2 gen/babbling_brook.wav
rm gen/babbling_brook.wav

for i in 1 2; do
  pvoc anal 1 gen/babbling_brook_c$i.wav gen/babbling_brook_c$i.ana
  blur blur gen/babbling_brook_c$i.ana gen/babbling_brook_blurred_c$i.ana 225
  pvoc synth gen/babbling_brook_blurred_c$i.ana gen/babbling_brook_blurred_c$i.wav
done

submix interleave gen/babbling_brook_blurred_c1.wav \
  gen/babbling_brook_blurred_c2.wav gen/babbling_brook_blurred_stereo.wav
paplay -i gen/babbling_brook_blurred_stereo.wav
