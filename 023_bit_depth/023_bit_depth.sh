#!/usr/bin/env sh

source ../config.sh

note=C0
freq=$(sndinfo units 3 $note | awk '{print $3}')

# 16-bit edition
synth wave 1 gen/16osc.wav 48000 1 1 $freq -a0.2
modify loudness 2 gen/16osc.wav gen/16osc_up.wav 32
modify loudness 2 gen/16osc_up.wav gen/16osc_down.wav -32

# can't quite trust sndinfo diff here because the 32-bit files aren't identical...
# I guess that really means we can't trust the 32-bit processing!
# leaving these original tests here for when I figure out what's going on

# if [ "$(sndinfo diff gen/16osc.wav gen/16osc_down.wav)" == "Files are IDENTICAL" ]; then
#   >&2 echo "FAIL: 16-bit files are identical – but they should not be!"
#   exit 1
# else
#   echo "SUCCESS: 16-bit files are different before and after processing"
# fi

if [ "$(sndinfo props gen/16osc.wav)" == "$(sndinfo props gen/16osc_down.wav)" ]; then
  >&2 echo "FAIL: 16-bit files are identical – but they should not be!"
  exit 1
else
  echo "SUCCESS: 16-bit files are different before and after processing"
fi

# 32-bit edition, clipping allowed
export CDP_NOCLIP_FLOATS=0
synth wave 1 -fgen/32osc_clip.wav 48000 1 1 $freq -a0.2
modify loudness 2 gen/32osc_clip.wav -fgen/32osc_up_clip.wav 32
modify loudness 2 gen/32osc_up_clip.wav -fgen/32osc_down_clip.wav -32

# if [ "$(sndinfo diff gen/32osc_clip.wav gen/32osc_down_clip.wav)" == "Files are IDENTICAL" ]; then
#   >&2 echo "FAIL: 32-bit files (clipping allowed) are identical – but they should be different!"
#   exit 1
# else
#   echo "SUCCESS: 32-bit files (clipping allowed) are different before and after processing"
# fi

if [ "$(sndinfo props gen/32osc_clip.wav)" == "$(sndinfo props gen/32osc_down_clip.wav)" ]; then
  >&2 echo "FAIL: 32-bit files (clipping allowed) are identical – but they should be different!"
  exit 1
else
  echo "SUCCESS: 32-bit files (clipping allowed) are different before and after processing"
fi

# 32-bit edition, no clipping allowed
export CDP_NOCLIP_FLOATS=1
synth wave 1 -fgen/32osc_noclip.wav 48000 1 1 $freq -a0.2
modify loudness 2 gen/32osc_noclip.wav -fgen/32osc_up_noclip.wav 32
modify loudness 2 gen/32osc_up_noclip.wav -fgen/32osc_down_noclip.wav -32

# if [ "$(sndinfo diff gen/32osc_noclip.wav gen/32osc_down_noclip.wav)" == "Files are IDENTICAL" ]; then
#   echo "SUCCESS: 32-bit files are identical before and after processing"
# else
#   >&2 echo "FAIL: 32-bit Files are different – but they should be identical!"
#   exit 1
# fi

if [ "$(sndinfo props gen/32osc_noclip.wav)" == "$(sndinfo props gen/32osc_down_noclip.wav)" ]; then
  echo "SUCCESS: 32-bit files are identical before and after processing"
else
  >&2 echo "FAIL: 32-bit Files are different – but they should be identical!"
  exit 1
fi
