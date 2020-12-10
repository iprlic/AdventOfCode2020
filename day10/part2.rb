#!/usr/bin/env ruby

def check_arragments(adapters, current)
  candidates = {}

  current.each do |key, value|
    if key == 0
      candidates[0] = candidates[0] ? candidates[0] + value : value
    else
      for i in 1..3 do
        if adapters.include?(key-i)
          candidates[key-i] = candidates[key-i] ? candidates[key-i] + value : value
        end
      end
    end
  end

  return candidates[0] if candidates.keys[0] == 0

  check_arragments(adapters, candidates)
end

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map(&:to_i)

input = input.sort.reverse
input.push(0)

puts check_arragments(input, { input.first => 1 })
