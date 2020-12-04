#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n\n").map { |p| p.split.map{ |v| v.split(':') } }

valid = input.select do |i|
  i.map do |p|
    type = p[0]
    value = p[1]

    (type == 'byr' && value.to_i <= 2002 && value.to_i >= 1920) ||
    (type == 'eyr' && value.to_i <= 2030 && value.to_i >= 2020) ||
    (type == 'iyr' && value.to_i <= 2020 && value.to_i >= 2010) ||
    (type == 'hgt' && value.match(/^(?:(?:1[5-8][0-9]|19[0-3])cm)$|^(?:(?:59|6[0-9]|7[0-6])in)$/)) ||
    (type == 'hcl' && value.match(/^(?:#[a-f0-9]{6})$/)) ||
    (type == 'ecl' && value.match(/^(?:amb|blu|brn|gry|grn|hzl|oth)$/)) ||
    (type == 'pid' && value.match(/^[0-9]{9}$/))
  end.map{ |m| m ? 1 : 0 }.sum == 7
end

puts valid.size

