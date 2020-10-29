require_relative 'node'
require_relative 'merge_sort'

# Each instance is balanced Binary Search Tree built from provided array.
class Tree

  def initialize(array)
    sorted_array = merge_sort(array)
    @root = build_tree(sorted_array)
  end

  def build_tree(array)
    # Two guard clauses: if array is only one element, and if array is empty.
    return nil if array[0].nil?;

    return Node.new(array[0]) if array.length == 1;

    mid_point = array.length / 2
    root_node = Node.new(array[mid_point])
    left_tree = array[0..mid_point - 1]
    right_tree = array[mid_point + 1..-1]

    root_node.left_child = build_tree(left_tree)
    root_node.right_child = build_tree(right_tree)

    root_node
  end

  def find(value)
    node = @root

    until node.nil?
      if value == node.data
        return node
      elsif value < node.data
        node = node.left_child
      elsif value > node.data
        node = node.right_child
      end
    end

    node
  end

  def insert(value)
    node = @root
    inserted = false

    until inserted
      if value < node.data
        if node.left_child.nil?
          node.left_child = Node.new(value)
          inserted = true
        else
          node = node.left_child
        end

      elsif value > node.data
        if node.right_child.nil?
          node.right_child = Node.new(value)
          inserted = true
        else
          node = node.right_child
        end
      end
    end
  end

  def delete(value)
    # TODO
    0
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end
