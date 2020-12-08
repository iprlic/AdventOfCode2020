#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map do |i|
  c = i.split(' ')
  { 'cmd' => c[0], 'arg' => c[1].to_i }
end

for j in 0..input.size-1 do
  i = 0
  acc = 0
  cmds_executed = []

  while !cmds_executed.include?(i)
    cmds_executed.push(i)

    if !input[i]
      puts acc
      exit
    end

    cmd = input[i]['cmd']
    arg = input[i]['arg']

    if i == j
      cmd = 'jmp' if cmd == 'nop'
      cmd = 'nop' if cmd == 'jmp'
    end

    case cmd
    when 'acc'
      acc += arg
      i += 1
    when 'jmp'
      i += arg
    when 'nop'
      i += 1
    end
  end
end
