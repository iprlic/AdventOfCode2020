#!/usr/bin/env ruby

def rotate(cx, cy, ang, px, py)
  rad = ang * Math::PI / 180

  x = (Math.cos(rad) * (px - cx)) + (Math.sin(rad) * (py - cy)) + cx
  y = (Math.cos(rad) * (py - cy)) - (Math.sin(rad) * (px - cx)) + cy

  [x.round, y.round]
end

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map{ |i| { 'com' => i[0], 'arg' => i[1..-1].to_i } }

current = [10, 1]
ship = [0, 0]

input.each do |i|
  com = i['com']
  arg = i['arg']

  current[1] += arg if com == 'N'
  current[1] -= arg if com == 'S'

  current[0] += arg if com == 'E'
  current[0] -= arg if com == 'W'


  if com == 'L'
    current = rotate(ship[0], ship[1], 0-arg, current[0], current[1])
  end

  if com == 'R'
    current = rotate(ship[0], ship[1], arg, current[0], current[1])
  end

  if com == 'F'
    y = (current[1] - ship[1]).abs
    x = (current[0] - ship[0]).abs

    dns = ''
    dwe = ''

    dns = 'N' if current[1] > ship[1]
    dns = 'S' if current[1] < ship[1]
    dwe = 'E' if current[0] > ship[0]
    dwe = 'W' if current[0] < ship[0]


    current[1] += y*arg if dns == 'N'
    current[1] -= y*arg if dns == 'S'

    current[0] += x*arg if dwe == 'E'
    current[0] -= x*arg if dwe == 'W'


    ship[1] += y*arg if dns == 'N'
    ship[1] -= y*arg if dns == 'S'

    ship[0] += x*arg if dwe == 'E'
    ship[0] -= x*arg if dwe == 'W'

  end
end

puts ship[0].abs + ship[1].abs
