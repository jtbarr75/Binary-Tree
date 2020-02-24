class Node
  include Comparable
  attr_accessor :value, :left, :right

  def initialize(value = nil)
    @value = value
  end

  def to_s
    value.to_s
  end

  def <=>(other)
    value <=> other
  end

  def insert(new_value)
    if new_value < value
      @left.nil? ? @left = Node.new(new_value) : @left.insert(new_value)
    else 
      @right.nil? ? @right = Node.new(new_value) : @right.insert(new_value)
    end
  end

  def delete(root = self, value)
    return root if root.nil?

    if root > value
      root.left = delete(root.left, value)
    elsif root < value
      root.right = delete(root.right, value)
    else
      if root.left.nil?    #if no left child delete node and move up right child
        temp = root.right  #if right child is also nil then nothing moves up
        root = nil
        return temp
      elsif root.right.nil?  #if no right child, delete node and move up right child
        temp = root.left
        root = nil
        return temp
      else               #if node has two children 
        temp = node.right
        temp = temp.left until temp.left.nil?       #find minumum value of the right branch
        root.value = temp.value                     #replace node with that value
        root.right = delete(root.right, temp.value) #delete the minimum value node
      end
    end
    root
  end
end