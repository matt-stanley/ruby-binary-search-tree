require_relative 'tree'

tree = Tree.new((1..30).to_a.shuffle)

tree.insert(-4)

tree.pretty_print