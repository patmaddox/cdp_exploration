# Balance mix

In `008_oscillators` I did a simple mix, where both oscillators have equal
power. But I want to mix the oscillators at different levels. Let's give that a
shot.

I could execute the `008_oscillators` script to produce oscillator files, but I
don't want to couple this script to the output of a previous one. The only
tricky part of it is figuring out how *not* to play the audio file from the
previous one... which is not something I feel like tackling right now. Plus this
gives me a chance to explore more of CDP's features. I think I saw something
about creating an oscillator with multiple pitches. At the very least, I know I
can re-pitch a signal...

## Notes

I used the same oscillator generator, but used `submix balance` instead of
`submix merge`.
