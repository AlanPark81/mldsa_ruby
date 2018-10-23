class BinaryTreeNode
  attr_accessor :data, :left, :right

  def initialize data
    @data = data
    @left = nil
    @right = nil
  end

  def take_max_under_this_node
    if @right.nil?
      return nil
    else
      parent=nil
      node = @right
      while not node.right.nil?
        parent=node
        node=node.right
      end
      return parent
    end
  end

  def take_min_under_this_node
    if @left.nil?
      return nil
    else
      parent = nil
      node = @left
      while not node.left.nil?
        parent = node
        node=node.left
      end
      return parent
    end
  end

  def take_closest_data
    if not @left.nil?
      parent = @left.take_max_under_this_node
      if parent.nil?
        ret_val = @left.data
        @left = nil
      else
        ret_val = parent.right.data
        parent.right = nil
      end
      return ret_val
    elsif not @right.nil?
      parent = @right.take_min_under_this_node
      if parent.nil?
        ret_val = @right.data
        @right = nil
      else
        ret_val = parent.left.data
        parent.left = nil
      end
      return ret_val
    end
    nil
  end

  def insert_node data
    if data > @data
      if @right.nil?
        @right=BinaryTreeNode.new data
      else
        @right.insert_node data
      end
    else
      if @left.nil?
        @left=BinaryTreeNode.new data
      else
        @left.insert_node data
      end
    end
  end
end

class BinarySearchTree
  attr_accessor :size

  def initialize
    @root = nil
    @size = 0
  end

  def insert data
    if @root.nil?
      @root = BinaryTreeNode.new data
    else
      @root.insert_node data
    end
    @size+=1
  end

  def remove data
    if @root.nil?
      return false
    end

    parent = nil
    node = @root
    while not node.nil?
      if node.data == data
        if node == @root
          val = @root.take_closest_data
          if val.nil?
            @root = nil
          else
            @root.data = val
          end
        else
          val = node.take_closest_data
          if val.nil?
            if node.data<parent.data
              parent.left = nil
            else
              parent.right = nil
            end
          else
            node.data = val
          end
        end
        @size-=1
        return true
      end
      parent = node
      if data < node.data
        node = node.left
      else
        node = node.right
      end
    end
    return false
  end

  def contains data
    node = @root
    while !node.nil? do
      if data == node.data
        return true
      elsif data < node.data
        node = node.left
      else
        node = node.right
      end
    end
    false
  end
end