class Tree
  require_relative 'node.rb'
  def initialize(arr = [])
    arr = arr.sort.uniq
    @root = build_tree arr
  end

  #builds a balanced tree of the given values
  def build_tree(arr)
    return nil if arr.empty?

    mid = (arr.length - 1)/2

    root = Node.new(arr[mid])
    root.left = build_tree(arr[0...mid])
    root.right = build_tree(arr[mid + 1..-1])
    root
  end

  def insert(value)
    @root.nil? ? @root = Node.new(value) : @root.insert(value)
  end

  def delete(value)
    @root.delete(value)
  end

  #traverses the tree by level order
  def level_order(root = @root, values = [], level = 0, &block)
    return values unless root

    if block_given?
      yield(root)
    else
      values << [] if values.length == level
      values[level] << root.value
    end
    level_order(root.left, values, level + 1, &block)
    level_order(root.right, values, level + 1, &block)
  end

  #returns the node with given value
  def find(root = @root, value)
    return root if root == value
    root > value ? find(root.left, value) : find(root.right, value)
  end

  #creates pre, post, and inorder methods
  ["preorder", "inorder", "postorder"].each do |name|
    define_method(name) do |root = @root, values = [], &block|
      return root if root.nil?
      block ? block.call(root) : values << root.value if name == "preorder"
      send(name, root.left, values, &block)
      block ? block.call(root) : values << root.value if name == "inorder"
      send(name, root.right, values, &block)
      block ? block.call(root) : values << root.value if name == "postorder"
      values
    end
  end

  #returns number of levels below current node
  def depth(root = @root)
    return 0 unless root
    left_depth = depth(root.left)
    right_depth = depth(root.right)
    left_depth > right_depth ? left_depth + 1 : right_depth + 1
  end

  #return true if depth of left and right nodes is no more than 1 apart
  def balanced?(root = @root)
    return true unless root
    ld = depth(root.left)
    rd = depth(root.right)
    if (ld - rd).between?(-1,1) && balanced?(root.left) && balanced?(root.right)
      return true
    end
    false
  end

  #builds a new balanced tree
  def rebalance!
    values = inorder
    @root = build_tree(values)
  end
end