#!/usr/bin/env ruby

start = Time.now

def count_trees(input, step_x, step_y)
  width = input.first.size
  height = input.size
  x, y, cnt = 0, 0, 0

  while x < height do
    field = input[x][y % width]

    cnt += 1 if field == '#'

    x += step_x
    y += step_y
  end

  cnt
end

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map(&:chars)


puts count_trees(input, 1, 1) *
     count_trees(input, 1, 3) *
     count_trees(input, 1, 5) *
     count_trees(input, 1, 7) *
     count_trees(input, 2, 1)

# code to time
finish = Time.now

puts finish-start
