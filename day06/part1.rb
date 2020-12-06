#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n\n")

cnt = input.reduce(0) do |sum, group|
  sum + group.split("\n").reduce([]) { |s, i| s | i.chars }.size
end

puts cnt
