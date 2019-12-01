#!/usr/bin/env sh

source ../config.sh

rm -f gen/outwav*.wav
submix inbetween 1 src/in1.wav src/in2.wav gen/outwav 12
sfedit join gen/outwav*.wav gen/morph_600.wav -w0

# pvoc anal 1 src/sine.wav gen/sine.ana
# pvoc anal 1 src/saw.wav gen/saw.ana
# spec grab gen/sine.ana gen/sine_spec.ana 1
# spec grab gen/saw.ana gen/saw_spec.ana 1
# morph glide gen/sine_spec.ana gen/saw_spec.ana gen/morph.ana 0.1
# pvoc synth gen/morph.ana gen/morph.wav
# paplay -i gen/morph.wav
