# Sequencing

Now that I've got sounds, how do I play them in sequence? That's what this
experiment is all about.

I'm going to use the kick drum sound I made in `014_a_kind_of_kick` and create a
simple four-on-the-floor pattern. I suspect it won't be too much trouble - but I
am curious to know how I'll make it a perfect four-bar loop. As I understand it,
the sequencing tool can shorten sounds but not extend them... so the first three
sounds might line up perfectly, but I may have trouble with the fourth. We'll
see!

## Notes

Yep... exactly what I thought. Three perfectly timed drum beats, and then it
ends as soon as the fourth drum is finished playing. This could be tricky...

Options:

* pre-render the kick file to have the space in it (still not sure that would
  work)
* extend the sound file to the correct length
* add a 0-length sample at the correct time at the end
* mix an empty file of the correct length

The second one seems most promising to me...

Okay, so it wasn't quite what I expected. But it still only took me a few
minutes to find. `silend silend` did the trick... adding silence to the end, and
specifying a final output length.
