#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n")

ids = input.map do |r|
  row = r.chars.first(7).reduce([0,127]) do |loc, d|
    d == 'F' ? [loc[0], loc[0] + (loc[1]-loc[0]).div(2)] : [loc[0] + 1 + (loc[1]-loc[0]).div(2), loc[1]]
  end.first

  column = r.chars.last(3).reduce([0,7]) do |loc, d|
    d == 'L' ? [loc[0], loc[0] + (loc[1]-loc[0]).div(2)] : [loc[0] + 1 + (loc[1]-loc[0]).div(2), loc[1]]
  end.first

  row * 8 + column
end.sort

start = ids.min

id = ids.each_with_index.reduce(0) do |m, (e, i)|
  e != i + start && m == 0 ? e - 1 : m
end

puts id
