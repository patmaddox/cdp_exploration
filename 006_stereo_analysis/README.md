# Stereo analysis

CDP does not support spectral analysis on stereo files. So if I want to mess
with stereo files, I need to split the file up into mono first and process
them separately. It looks like:

1. Split stereo file into two mono files
2. Analyze each file separately
3. Process each spectral file separately
4. Synthesize the spectral files separately
5. Combine the spectral files into a single stereo file

I'm reusing the source file from `005_monoize`.
