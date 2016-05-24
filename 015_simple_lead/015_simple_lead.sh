#!/usr/bin/env sh

source ../config.sh

# params
base_freq=261.6255653006
offset=3.75
lo_freq=$(echo "$base_freq - $offset" | bc)
hi_freq=$(echo "$base_freq + $offset" | bc)

# oscillators
synth wave 3 gen/osc_lo.wav 48000 1 10 $lo_freq -a0.2
synth wave 3 gen/osc_hi.wav 48000 1 10 $hi_freq -a0.2
submix merge gen/osc_lo.wav gen/osc_hi.wav gen/simple_lead.wav

# envelopes
modify speed 6 gen/simple_lead.wav gen/lead_vibrato.wav vibrate.brk vibdepth.brk
envel impose 3 gen/lead_vibrato.wav amp.brk gen/lead_finished.wav

paplay -i gen/lead_finished.wav
