# Bit depth

As far as I know, CDP doesn't export to 24-bit files. It only exports to 16-bit
fixed point or 32-bit floating point. All processing is done at 32-bit floating
point though.

This experiment compares how CDP handles high gain levels in three scenarios:

1. 16-bit
2. 32-bit (NO_CLIP_FLOATS=1)
3. 32-bit (NO_CLIP_FLOATS=0 / unset)

The process is simple:

1. Generate an audio file
2. Jack up the gain big time!
3. Lower the gain back down
4. Compare the original and processed files

16-bit should be different - jacking up the gain will clip it, and there's no
recovering from that. 32-bit (NO_CLIP_FLOATS=1) should be before and after
processing. And then there's the scenario where the variable isn't set... I
guess that will clip. It's a bit of a bummer that you even have to remember
that, because the whole reason for floating to point is to not have to think
about that sort of thing. We'll see what happens.

## Notes

Something is slightly off with the 32-bit no clip processing. The files differ
subtly – I think it's the timing of the samples. The processed files sound the
same, but they differ in some way, and when I invert and mix them they don't
null. Not sure what's going on... I'll adjust the test for now to use a
different method of comparison (looking at the peak amplitude).
