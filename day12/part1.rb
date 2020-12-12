#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map{ |i| { 'com' => i[0], 'arg' => i[1..-1].to_i } }

current = {'f' => 1, 'p' => [0, 0]}
faces = {1 => 'E', 2 => 'S', 3=> 'W', 4 => 'N'}


input.each do |i|
  com = i['com']
  arg = i['arg']

  current['p'][1] += arg if com == 'N'
  current['p'][1] -= arg if com == 'S'

  current['p'][0] -= arg if com == 'W'
  current['p'][0] += arg if com == 'E'

  if com == 'L'
    r = arg / 90
    f = current['f'] - r
    f += 4 if f <= 0
    current['f'] = f
  end

  if com == 'R'
    r = arg / 90
    f = current['f'] + r
    f -= 4 if f >= 5
    current['f'] = f
  end

  if com == 'F'
    current['p'][1] += arg if faces[current['f']] == 'N'
    current['p'][1] -= arg if faces[current['f']] == 'S'

    current['p'][0] -= arg if faces[current['f']] == 'W'
    current['p'][0] += arg if faces[current['f']] == 'E'
  end
end

puts current['p'][0].abs + current['p'][1].abs
