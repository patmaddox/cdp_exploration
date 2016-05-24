# BPM tricks

Okay this one feels a bit ambitious. But I'll give it a go.

The idea is simple: instead of laying out sounds on a specific timeline, I want
to lay them out on a tempo grid. So I'll have something like:

```
beat      transpose   vol (this line doesn't go in there...)
1.1       0           1
1.35      0           1
2.1       0           1
2.35      0           1
2.45      0           1
```

Which would be a simple breakbeat kick pattern.

I don't think CDP has something like this built-in. I looked around and didn't
find anything. I bet it has it, I just haven't found it yet. But I'll have a go
at parsing and generating the proper file...

## Notes

It took a bit of work, but I figured it out. I ended up changing the format a
bit:

```
# before
1.1     0     1
1.35    0     0

# after
1-1     0     1
1-3.5   0     1
```

I could have done something like "1.1.5" but I decided to use "-" as a
measure-beat separator to do an easy split in Ruby. The dot syntax would have
been an extra line or two :P

I'm torn, because it was kind of fun, and I feel good when I play the sequence.
But I'm not sure it's totally worth it :)  That said... I've written the basic
BPM sequencing functionality. I never have to write it again! And the BPM
sequence file isn't even all that bad.

### New stuff about CDP...

* There's a `sndinfo units` command which will convert midi notes to frequencies
  and back, plus intervals, and other good stuff. Unfortunately I don't see
  something for BPM. I bet it's in there somehwere though

* All the output wav files are 16-bit... I wonder if there's a way to make it
  use 24-bit as the output format? 32-bit floating point is big but that's at
  least preferable to 16-bit. Something to investigate...

* There was something else, but I forgot :)
