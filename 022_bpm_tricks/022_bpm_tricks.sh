#!/usr/bin/env sh

source ../config.sh

bpm=172
measures=2
length=$(ruby -e "require 'bigdecimal'; print ((BigDecimal.new("60") / $bpm) * ($measures * 4)).to_s('F')")
echo "length is: $length"

# create kick drum
synth wave 3 gen/triangle.wav 48000 1 10 44 -a0.2
modify speed 2 gen/triangle.wav gen/pitched.wav pitch.brk
envel impose 3 gen/pitched.wav amp.brk gen/pitched_and_amped.wav

# generate sequence file from BPM sequence file
./convert_bpm_to_seconds.rb bpm_sequence.txt gen/sequence.txt $bpm
extend sequence gen/pitched_and_amped.wav gen/sequence.wav gen/sequence.txt 1
silend silend 2 gen/sequence.wav gen/sequence_full_length.wav $length

paplay -i gen/sequence_full_length.wav
