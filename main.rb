require_relative 'tree'

tree = Tree.new(Array.new(15) { rand(1..100) })

tree.pretty_print

puts "Balanced? #{tree.balanced?}\n\n"

puts "Level Order: \n#{tree.level_order}\n\n"

puts "Pre-Order: \n#{tree.preorder}\n\n"

puts "Post-Order: \n#{tree.postorder}\n\n"

puts "In-Order: \n#{tree.inorder}\n\n"

100.times do
  tree.insert(rand(95..200))
end

puts "Balanced? #{tree.balanced?}\n\n"

puts 'Balancing. . .'
tree.rebalance

tree.pretty_print

puts "Balanced? #{tree.balanced?}\n\n"

puts "Level Order: \n#{tree.level_order}\n\n"

puts "Pre-Order: \n#{tree.preorder}\n\n"

puts "Post-Order: \n#{tree.postorder}\n\n"

puts "In-Order: \n#{tree.inorder}\n\n"
