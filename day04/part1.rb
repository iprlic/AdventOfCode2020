#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n\n").map { |i| i.split.map { |m| m[/[^:]+/] } }

puts input.select { |i| (i & ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid']).size == 7 }.size

