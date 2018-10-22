class Node
  def initialize data
    @prev = nil
    @next = nil
    @data = data
  end

  attr_accessor :data, :prev, :next
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def front
    if @head.nil?
      raise "empty"
    end
    @head.data
  end

  def back
    if @tail.nil?
      raise "empty"
    end
    @tail.data
  end

  def insert_back data
    @size += 1
    if @head.nil?
      @head = Node.new data
      @tail = @head
      return
    end
    @tail.next = Node.new data
    @tail.next.prev = @tail
    @tail=@tail.next
  end

  def insert_front data
    @size += 1
    if @head.nil?
      @head = Node.new data
      @tail = @head
      return
    end
    @head.prev = Node.new data
    @head.prev.next = @head
    @head=@head.prev
  end

  def is_empty?
    @head.nil?
  end

  def pop_front
    if @head.nil?
      raise "empty"
    end
    ret_val = @head.data
    @head = @head.next
    @size -= 1
    ret_val
  end

  def pop_back
    if @tail.nil?
      raise "empty"
    end
    ret_val = @tail.data
    @tail = @tail.prev
    @size -= 1
    ret_val
  end

  attr_reader :size
end

