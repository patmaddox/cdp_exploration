#!/usr/bin/env ruby
require 'bigdecimal'

bpm_file = ARGV[0]
outfile = ARGV[1]
bpm = ARGV[2].to_i
quarter_value = BigDecimal.new("60") / bpm

lines = File.readlines bpm_file
File.open(outfile, "w") do |file|
  lines.each do |line|
    timing, transpose, volume = line.split
    timing_parts = timing.split "-"

    measure = timing_parts[0].to_i
    beat = BigDecimal.new(timing_parts[1])
    placement = (((measure - 1) * 4) + (beat - 1)) * quarter_value

    file << [placement.to_s('F'), transpose, volume].join("\t")
    file << "\n"
  end
end
