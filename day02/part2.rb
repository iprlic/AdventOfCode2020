#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)

valid = input.split("\n").select do |i|

  row = i.split(" ")
  times = row.first.split('-')
  letter = row[1].chars.first
  word = row[2]

  (word[times[0].to_i-1] == letter) ^ (word[times[1].to_i-1] == letter)
end

puts valid.size
