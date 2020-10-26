# Creates a new node for the linked list.
# Holds a value and a reference to the next node in the list.
class Node
  attr_accessor :data, :left_child, :right_child

  def initialize(data = nil)
    @data = data
    @left_child = nil
    @right_child = nil
  end

end