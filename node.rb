# Creates a new node for the linked list.
# Holds a value and a reference to the next node in the list.
class Node
  attr_accessor :next_node, :value

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end

end