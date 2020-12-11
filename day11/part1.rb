#!/usr/bin/env ruby

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map(&:chars)

changes = true

height = input.size
width = input.first.size

seats = input
cnt = 0

while changes
  changes = false
  new_seats = []
  cnt = 0

  for i in 0..width-1
    for j in 0..height-1
      new_seats.push([]) if !new_seats[j]

      if seats[j][i] == 'L'
        occupy = true
        occupy = false if j > 0 && i > 0 && seats[j-1][i-1] == '#'
        occupy = false if j > 0 && seats[j-1][i] == '#'
        occupy = false if j > 0 && i != width - 1 && seats[j-1][i+1] == '#'
        occupy = false if i > 0 && seats[j][i-1] == '#'
        occupy = false if i != width - 1 && seats[j][i+1] == '#'
        occupy = false if j != height - 1 && i > 0 && seats[j+1][i-1] == '#'
        occupy = false if j != height - 1 && seats[j+1][i] == '#'
        occupy = false if j != height - 1 && i != width - 1 && seats[j+1][i+1] == '#'

        if occupy
          new_seats[j].push('#')
          changes = true
        else
          new_seats[j].push(seats[j][i])
        end
      elsif seats[j][i] == '#'
        occupy = 0
        occupy += 1 if j > 0 && i > 0 && seats[j-1][i-1] == '#'
        occupy += 1 if j > 0 && seats[j-1][i] == '#'
        occupy += 1 if j > 0 && i != width - 1 && seats[j-1][i+1] == '#'
        occupy += 1 if i > 0 && seats[j][i-1] == '#'
        occupy += 1 if i != width - 1 && seats[j][i+1] == '#'
        occupy += 1 if j != height - 1 && i > 0 && seats[j+1][i-1] == '#'
        occupy += 1 if j != height - 1 && seats[j+1][i] == '#'
        occupy += 1 if j != height - 1 && i != width - 1 && seats[j+1][i+1] == '#'

        if occupy >= 4
          new_seats[j].push('L')
          changes = true
        else
          new_seats[j].push(seats[j][i])
        end
      else
        new_seats[j].push(seats[j][i])
      end
      cnt += 1 if new_seats[j][i] == '#'
    end
  end

  seats = new_seats
end

puts cnt
