# frozen_string_literal: false

# LinkedList are composed of Nodes, each having a value and a pointer to the next node
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    return @head = new_node if head.nil?

    tail.next_node = new_node
  end

  def at(index)
    pointer = head
    index.times do
      pointer = pointer.next_node
    end
    pointer
  end

  def contains?(value)
    return false if head.nil?

    pointer = head
    until pointer.next_node.nil?
      return true if value == pointer.value

      pointer = pointer.next_node
    end
    false
  end

  def find(value)
    0.upto(size - 1) do |index|
      return index if at(index).value == value
    end
    nil
  end

  def pop
    return nil if head.nil?

    value = tail.value
    if size == 1
      @head = nil
    else
      new_tail = at(size - 2)
      new_tail.next_node = nil
    end
    value
  end

  def prepend(value)
    new_node = Node.new(value)
    return @head = new_node if @head.nil?

    new_node.next_node = @head
    @head = new_node
  end

  def size
    size = 0
    node = @head
    until node.nil?
      node = node.next_node
      size += 1
    end
    size
  end

  def tail
    return head if head.nil?

    tail = head
    tail = tail.next_node until tail.next_node.nil?
    tail
  end

  def to_s
    node = head
    string = ''
    until node.nil?
      string << "(#{node.value}) -> "
      node = node.next_node
    end
    string << 'nil'
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
