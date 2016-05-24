# Towards composability

The most exciting thing about CDP to me - besides the weird digital
transformations it offers - is the prospect of creating a library of personal
sound transformations that I can use to quickly compose new sounds.

For this experiment, I'll take the script from `017_spacey_pad` and extract
elements into their own programs that I can call, encapsulating common CDP
functions.

## Notes

Again, that was pretty fast and easy. As far as this sound goes, the only thing
that really made sense to extract was the oscillator. I saved a few
parameters... including one I regularly mess up (the sample rate).

```bash
# before
synth wave $wavetype gen/osc_lo.wav 48000 1 20 $lo_freq -a0.2

# after
./oscillator.sh $wavetype gen/osc_hi.wav 20 $hi_freq
```
