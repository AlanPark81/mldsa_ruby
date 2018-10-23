class BinaryTreeNode
  attr_accessor :data, :left, :right

  def initialize data
    @data = data
    @left = nil
    @right = nil
  end

  def take_max_under_this_node
    return nil if right.nil?

    parent = nil
    node = right
    while node.right
      parent = node
      node = node.right
    end
    parent
  end

  def take_min_under_this_node
    return nil if left.nil?

    parent = nil
    node = left
    while node.left
      parent = node
      node = node.left
    end
    parent
  end

  def take_closest_data
    return false unless @left or @right

    if @left
      parent = @left.take_max_under_this_node
      if parent.nil?
        ret_val = @left.data
        @left = nil
      else
        ret_val = parent.right.data
        parent.right = nil
      end
    elsif @right
      parent = @right.take_min_under_this_node
      if parent.nil?
        ret_val = @right.data
        @right = nil
      else
        ret_val = parent.left.data
        parent.left = nil
      end
    end
    self.data = ret_val
    return true
  end

  def insert_right data
    @right.insert_node data if @right
    @right ||= BinaryTreeNode.new data unless @right
  end

  def insert_left data
    @left.insert_node data if @left
    @left ||= BinaryTreeNode.new data unless @left
  end

  def insert_node data
    insert_right data if data > @data
    insert_left data if data < @data
  end
end

class BinarySearchTree
  attr_accessor :size

  def initialize
    @root = nil
    @size = 0
  end

  def insert data
    @root.insert_node data if @root
    @root = BinaryTreeNode.new data if @root.nil?
    @size += 1
  end

  def remove data
    return false if @root.nil?

    if @root.data == data
      @root = nil unless @root.take_closest_data
      @size -= 1
      return true
    end

    parent = nil
    node = @root
    while node
      if node.data == data
        result = node.take_closest_data
        parent.left = nil if node.data < parent.data && !result
        parent.right = nil if node.data > parent.data && !result
        @size -= 1
        return true
      end
      parent = node
      node = (data < node.data ? node.left : node.right)
    end
    false
  end

  def contains data
    node = @root
    while node do
      return true if data == node.data

      node = ( data < node.data ? node.left : node.right)
    end
    false
  end
end