#!/usr/bin/env ruby

def bag_count(the_bag, bags, prev_cnt)
  bags.each do |b|
      return count = b['content'].reduce(0) do |cnt, c|
        cnt += c[0].to_i * prev_cnt + bag_count(c[1], bags, c[0].to_i * prev_cnt)
      end if b['container'] == the_bag
  end
end

file_path = File.expand_path('input.txt', __dir__)
input = File.read(file_path).split("\n").map do |i|
  s = i.split(' bags contain ')
  container = s.first()
  content = s.last().scan(/(?:(\d+) (.*?) bags?[,.])/)

  { 'container' => container, 'content' => content}
end


the_bag = 'shiny gold'

puts bag_count(the_bag, input, 1)
