class ListNode
  def initialize data
    @data = data
    @next = nil
    @prev = nil
  end

  attr_accessor :next
  attr_accessor :prev
  attr_reader :data

end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def empty?
    @head.nil?
  end

  def insert_back data
    if @tail.nil?
      @tail = ListNode.new data
      @head = @tail
    else
      new_node = ListNode.new data
      @tail.next = new_node
      new_node.prev = @tail
      @tail=new_node
    end
  end

  def insert_front data
    if @head.nil?
      @head=ListNode.new data
      @tail=@head
    else
      new_node = ListNode.new data
      @head.prev=new_node
      new_node.next=@head
      @head=new_node
    end
  end

  def pop_front
    if @head.nil?
      raise "empty"
    elsif @head == @tail
      data = @head.data
      @head = nil
      @tail = nil
    else
      data = @head.data
      @head = @head.next
    end
    data
  end

  def pop_back
    if @tail.nil?
      raise "empty"
    elsif @head == @tail
      data = @tail.data
      @head = nil
      @tail = nil
    else
      data=@tail.data
      @tail=@tail.prev
    end
    data
  end
end