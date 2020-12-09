#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map(&:to_i)

preamble = 25

for i in preamble..input.size-1 do
  if input.slice(i-preamble, preamble).combination(2).all? { |m| m.sum != input[i]  }
    puts input[i]
    exit
  end
end
