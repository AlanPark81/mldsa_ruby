require 'benchmark'
require './lib/linked_list'


puts "back read"
size = 1024

while size <= 1024*128 do
  input = LinkedList.new

  size.times do
    input.insert_back 1
  end

  puts(
    Benchmark.measure do
      1024.times do
        input.back
      end
    end
  )
  size *= 2
end

puts "pop back"
size = 1024

while size <= 1024*128 do
  input = LinkedList.new

  size.times do
    input.insert_back 1
  end

  puts(
    Benchmark.measure do
      1024.times do
        input.pop_back
      end
    end
  )
  size *= 2
end




