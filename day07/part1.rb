#!/usr/bin/env ruby

def bag_count(the_bag, bags)
  found = []
  bags.each do |b|
    found = found | [b['container']] | bag_count(b['container'], bags) if b['content'].include?(the_bag)
  end

  found
end

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map do |i|
  s = i.split(' bags contain ')
  container = s.first()
  content = s.last().scan(/(?:(\d+) (.*?) bags?[,.])/).map(&:last)

  { 'container' => container, 'content' => content}
end

the_bag = 'shiny gold'

puts bag_count(the_bag, input).size
