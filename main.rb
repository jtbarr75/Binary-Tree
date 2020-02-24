require_relative 'tree.rb'

# list = [1,2,3,4,5,6,7,8,9,10,11,12,13]
# tree = Tree.new list
# puts tree.level_order.inspect
# puts tree.inorder.inspect
# puts tree.preorder.inspect
# puts tree.postorder.inspect
# tree.insert(15)
# puts tree.inorder.inspect
# tree.delete(5)
# puts tree.level_order.inspect
# puts tree.find(1).inspect
# tree.level_order {|node| node.value *= 2}
# puts tree.level_order.inspect
# tree.inorder {|node| node.value *= 2}
# puts tree.inorder.inspect

tree = Tree.new(Array.new(15) { rand(1..100) })
puts "Is the tree balanced? #{tree.balanced?}" 
puts tree.level_order.inspect
puts tree.inorder.inspect
puts tree.preorder.inspect
puts tree.postorder.inspect
tree.insert(105)
tree.insert(121)
tree.insert(135)
tree.insert(101)
puts tree.level_order.inspect
puts "Is the tree balanced? #{tree.balanced?}" 
tree.rebalance!
puts "Is the tree balanced? #{tree.balanced?}" 
puts tree.level_order.inspect
# puts tree.inorder.inspect
# tree.level_order {|node| node.value *= 2}
# puts tree.inorder.inspect
# tree.inorder {|node| node.value *= 2}
# puts tree.inorder.inspect
