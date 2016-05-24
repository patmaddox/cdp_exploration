# Basic experiment

I just want to write a script that takes an audio source file, processes it
in some way, and generates output.

The source file will live in src/ and not be modified. This gets checked into
git. The processed files will live in gen/ and will be excluded from git.

## Result

Produces a file `gen/babbling_brook_low_pass.wav` which is a low-passed
version of `src/babbling_brook.wav`.

### Notes

* I may not always want it to auto-play. Maybe an environment variable?
* Making the gen directory and removing generated files every time is going
  to get annoying. Some kind of abstraction will probably be useful...
