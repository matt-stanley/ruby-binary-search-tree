require_relative 'tree'

tree = Tree.new((1..30).to_a.shuffle)

tree.pretty_print

p tree.preorder
