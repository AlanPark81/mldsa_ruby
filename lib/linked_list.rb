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
  end

  def insert_back data
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
    ret_val
  end

  def pop_back
    if @tail.nil?
      raise "empty"
    end
    ret_val = @tail.data
    @tail = @tail.prev
    ret_val
  end
end

