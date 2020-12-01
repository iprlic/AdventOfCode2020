#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path)

puts input.split("\n").map(&:to_i).combination(3).select { |m| m.sum == 2020  }.first.reduce(:*)
