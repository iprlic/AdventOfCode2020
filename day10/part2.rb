#!/usr/bin/env ruby

def check_arragments(adapters, current)
  candidates = {}
  all_zeros = true

  current.each do |key, value|
    if key == 0
      candidates[0] = candidates[0] ? candidates[0] + value : value
    else
      if adapters.include?(key-1)
        candidates[key-1] = candidates[key-1] ? candidates[key-1] + value : value
        all_zeros = false
      end
      if adapters.include?(key-2)
        candidates[key-2] = candidates[key-2] ? candidates[key-2] + value : value
        all_zeros = false
      end
      if adapters.include?(key-3)
        candidates[key-3] = candidates[key-3] ? candidates[key-3] + value : value
        all_zeros = false
      end
    end
  end

  adapters = adapters.reject { |a| a > candidates.keys.max}

  if all_zeros
    return candidates[0]
  else
    check_arragments(adapters, candidates)
  end
end

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map(&:to_i)

input = input.sort.reverse
input.push(0)

puts check_arragments(input, { input.first => 1 })
