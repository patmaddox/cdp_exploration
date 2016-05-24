#!/usr/bin/env sh

source ../config.sh

lo_freq=440
hi_freq=$(echo "$lo_freq * 3 / 2 + 4" | bc) # detuned just a bit
wavetype=3

./oscillator.sh $wavetype gen/osc_lo.wav 20 $lo_freq
./oscillator.sh $wavetype gen/osc_hi.wav 20 $hi_freq
submix balance gen/osc_lo.wav gen/osc_hi.wav gen/osc_mix.wav -k0.6

# envelope
filter variable 2 gen/osc_mix.wav gen/filtered.wav 0.25 0.5 freq.brk
envel impose 3 gen/filtered.wav amp.brk gen/enveloped.wav

# reverb
reverb gen/enveloped.wav gen/verby.wav 0.8 0 4 0.6 4000 5

paplay -i gen/verby.wav
