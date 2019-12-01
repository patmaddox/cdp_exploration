# Interpolate

I want to create wavetables that smoothly transition from one sound to another.
The first step in that process is interpolating from one single-cycle sample to
another.

## The process

1. Create a single cycle sine wave
2. Create a single cycle saw wave
3. Analyze them
4. Interpolate between the analysis
5. Resynthesize

For this experiment I'm just going to use an existing sample file rather than
using CDP to generate it.
