#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'
require_relative 'lib/hashslice'

# Create a test hash
hash = {}
('a'..'z').each_with_index { |letter, index| hash[letter] = index }

puts "Hash size: #{hash.size}"
puts

# Benchmark different operations
Benchmark.bm(25) do |x|
  x.report("Single key access (1000x):") do
    1000.times { hash['a'] }
  end

  x.report("Multi key access (1000x):") do
    1000.times { hash['a', 'b', 'c', 'd', 'e'] }
  end

  x.report("Hash slice (1000x):") do
    1000.times { hash.hash_of('a', 'b', 'c', 'd', 'e') }
  end

  x.report("Assignment (1000x):") do
    1000.times { hash['x', 'y', 'z'] = 100, 200, 300 }
  end
end
