require_relative 'node'
require_relative 'merge_sort'

# Each instance is balanced Binary Search Tree built from provided array.
class Tree
  attr_reader :root
  def initialize(array)
    sorted_array = merge_sort(array.uniq)
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
      elsif value == node.data
        inserted = true
      end
    end
  end

  def delete(value)
    tree_array = level_order
    tree_array.delete(value)

    @root = build_tree(tree_array)
  end

  def level_order
    search_array = [] # Stores values found
    node_queue = [] # Stores nodes to visit later

    node_queue.push(@root)

    until node_queue.length <= 0
      current_node = node_queue.shift

      search_array.push(current_node.data)

      node_queue.push(current_node.left_child) if current_node.left_child;
      node_queue.push(current_node.right_child) if current_node.right_child;
    end

    search_array
  end

  def inorder(node = @root, arr = [])
    return nil if node.nil?;

    left_tree = inorder(node.left_child, arr)
    arr = left_tree if left_tree

    arr.push(node.data)

    right_tree = inorder(node.right_child, arr)
    arr = right_tree if right_tree

    arr
  end

  def preorder(node = @root, arr = [])
    return nil if node.nil?;

    arr.push(node.data)

    left_tree = preorder(node.left_child, arr)
    arr = left_tree if left_tree

    right_tree = preorder(node.right_child, arr)
    arr = right_tree if right_tree

    arr
  end

  def postorder(node = @root, arr = [])
    return nil if node.nil?;

    left_tree = postorder(node.left_child, arr)
    arr = left_tree if left_tree

    right_tree = postorder(node.right_child, arr)
    arr = right_tree if right_tree

    arr.push(node.data)

    arr
  end

  def height(node = @root)
    return 0 if node.nil?

    left_height = height(node.left_child)
    right_height = height(node.right_child)

    if left_height > right_height
      left_height + 1
    else
      right_height + 1
    end
  end

  def depth(search_node, current_node = @root, level = 0)
    return 0 if current_node.nil?

    return level if current_node == search_node

    down_level = depth(search_node, current_node.left_child, level + 1)

    return down_level unless down_level.zero?

    down_level = depth(search_node, current_node.right_child, level + 1)

    down_level
  end

  def balanced?
    (height(@root.left_child) - height(@root.right_child)).abs <= 1
  end

  def rebalance
    sorted_array = merge_sort(level_order.uniq)
    @root = build_tree(sorted_array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end
