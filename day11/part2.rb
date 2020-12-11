#!/usr/bin/env ruby

def upLeft(i, j, seats, width, height)
  while i > 0 && j > 0
    return seats[j-1][i-1] if seats[j-1][i-1] != '.'
    i -= 1
    j -= 1
  end
  return '.'
end

def up(i, j, seats, width, height)
  while j > 0
    return seats[j-1][i] if seats[j-1][i] != '.'
    j -= 1
  end
  return '.'
end

def upRight(i, j, seats, width, height)
  while  j > 0 && i != width - 1
    return seats[j-1][i+1] if seats[j-1][i+1] != '.'
    j -= 1
    i +=1
  end
  return '.'
end

def left(i, j, seats, width, height)
  while  i > 0
    return seats[j][i-1] if seats[j][i-1] != '.'
    i -= 1
  end
  return '.'
end

def right(i, j, seats, width, height)
  while  i != width - 1
    return seats[j][i+1] if seats[j][i+1] != '.'
    i +=1
  end
  return '.'
end

def downRight(i, j, seats, width, height)
  while  j != height - 1 && i > 0
    return seats[j+1][i-1] if seats[j+1][i-1] != '.'
    j +=1
    i -=1
  end
  return '.'
end

def down(i, j, seats, width, height)
  while  j != height - 1
    return seats[j+1][i] if seats[j+1][i] != '.'
    j += 1
  end
  return '.'
end

def downLeft(i, j, seats, width, height)
  while  j != height - 1 && i != width - 1
    return seats[j+1][i+1] if seats[j+1][i+1] != '.'
    j +=1
    i +=1
  end
  return '.'
end


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
        occupy = false if upLeft(i, j, seats, width, height) == '#'
        occupy = false if up(i, j, seats, width, height) == '#'
        occupy = false if upRight(i, j, seats, width, height) == '#'
        occupy = false if left(i, j, seats, width, height) == '#'
        occupy = false if right(i, j, seats, width, height) == '#'
        occupy = false if downLeft(i, j, seats, width, height) == '#'
        occupy = false if down(i, j, seats, width, height)  == '#'
        occupy = false if downRight(i, j, seats, width, height) == '#'

        if occupy
          new_seats[j].push('#')
          changes = true
        else
          new_seats[j].push(seats[j][i])
        end
      elsif seats[j][i] == '#'
        occupy = 0
        occupy += 1 if upLeft(i, j, seats, width, height) == '#'
        occupy += 1 if up(i, j, seats, width, height) == '#'
        occupy += 1 if upRight(i, j, seats, width, height) == '#'
        occupy += 1 if left(i, j, seats, width, height) == '#'
        occupy += 1 if right(i, j, seats, width, height) == '#'
        occupy += 1 if downLeft(i, j, seats, width, height) == '#'
        occupy += 1 if down(i, j, seats, width, height)  == '#'
        occupy += 1 if downRight(i, j, seats, width, height) == '#'

        if occupy >= 5
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
