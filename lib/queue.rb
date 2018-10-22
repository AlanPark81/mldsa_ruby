require "linked_list"

class Queue
  def initialize
    @list = LinkedList.new
  end

  def front
    @list.front
  end

  def back
    @list.back
  end

  def enqueue data
    @list.insert_back data
  end

  def dequeue
    @list.pop_front
  end

  def size
    @list.size
  end
end