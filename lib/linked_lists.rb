# frozen_string_literal: true

# LinkedList are composed of Nodes, each having a value and a pointer to the next node
class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    return @head = new_node if @head.nil?

    pointer = @head
    pointer = pointer.next_node until pointer.next_node.nil?
    pointer.next_node = new_node
  end
end

# A Node has a value and a pointer to the next node
class Node
  attr_accessor :next_node
  attr_reader :value

  def initialize(value = nil)
    @value = value
  end
end
