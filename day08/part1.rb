#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map do |i|
  c = i.split(' ')
  { 'cmd' => c[0], 'arg' => c[1].to_i }
end

cmds_executed = []
i = 0
acc = 0

while !cmds_executed.include?(i)
  cmds_executed.push(i)

  case input[i]['cmd']
  when 'acc'
    acc += input[i]['arg']
    i += 1
  when 'jmp'
    i += input[i]['arg']
  when 'nop'
    i += 1
  end

end

puts acc
