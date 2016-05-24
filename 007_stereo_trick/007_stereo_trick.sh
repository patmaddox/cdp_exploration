#!/usr/bin/env sh

source ../config.sh

channel1=../001_basics/src/babbling_brook.wav
channel2=gen/babbling_brook_c2.wav
stereo=gen/babbling_brook_stereo.wav
compare=../005_monoize/src/babbling_brook.wav

modify radical 1 $channel1 $channel2
submix interleave $channel1 $channel2 $stereo

result=$(sndinfo diff $stereo $compare)

if [ "$result" == "Files are IDENTICAL" ]; then
  echo "SUCCESS: $result"
else
  >&2 echo "FAIL: Files are not identical!"
  echo $result
  exit 1
fi
