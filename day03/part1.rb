#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map(&:chars)

width = input.first.size
height = input.size
x, y, cnt = 0, 0, 0

while x < height do
  field = input[x][y % width]

  cnt += 1 if field == '#'

  x += 1
  y += 3
end

puts cnt
