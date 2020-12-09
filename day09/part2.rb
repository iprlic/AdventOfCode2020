#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map(&:to_i)

preamble = 25
weak_one = nil

for i in preamble..input.size-1 do
  if input.slice(i-preamble, preamble).combination(2).all? { |m| m.sum != input[i]  }
    weak_one = input[i]
    break
  end
end

max_members = []

for x in 0..input.size-1
  sum = 0
  i = x
  members = []

  while sum < weak_one && input[i]
    sum += input[i]
    members.push(input[i])
    i += 1

    max_members = members if sum == weak_one && max_members.size < members.size
  end
end

puts max_members.min + max_members.max
