require_relative 'node'
require_relative 'merge_sort'

class Tree

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    sorted_array = merge_sort(array)

    
  end
end
