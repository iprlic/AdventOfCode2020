#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map(&:to_i).sort

ones = 0
threes = 1
last = 0

input.each do |e|
  ones +=1 if e-last == 1
  threes +=1 if e-last == 3
  last = e
end

puts ones * threes
