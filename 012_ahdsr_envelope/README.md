# AHDSR envelope

Simulating an AHDSR envelope...

## Notes

That turned out to be way easier than I thought! And it's actually pretty fun to
create the envelope using a text file of breakpoints. It didn't take me very
long. I just have to think about the shape a little bit.

Also, I was tired of how the sox `play` command was stuttering. I figured there
had to be a CDP way to play files and there is - `paplay -i` will play a file
without waiting (it waits for a keypress if you don't use `-i`).
