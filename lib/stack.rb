require 'linked_list'

class Stack
  def initialize
    @list = LinkedList.new
  end

  def push data
    @list.insert_back data
  end

  def pop
    if @list.is_empty?
      raise "empty"
    end
    @list.pop_front
  end

  def front
    if @list.is_empty?
      raise "empty"
    end
    @list.front
  end

  def size
    @list.size
  end
end