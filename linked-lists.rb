class LinkedList

  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    value = Node.new(value)
    return prepend(value.value) if @head.nil?
    @size += 1
    pointer = @head
    until pointer.nodelink == nil
      pointer = pointer.nodelink
    end
    pointer.nodelink = value
  end

  def prepend(value) 
    value = Node.new(value)
    @size += 1
    previous_head = @head
    @head = value
    @head.nodelink = previous_head
  end

  def pop
    @size -= 1
    at((@size-1)).nodelink = nil
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    return self.prepend(new_node.value) if index.zero?
    return self.append(new_node.value) if index == @size
    prev, curr = self.at(index-1), self.at(index)
    prev.nodelink = new_node
    new_node.nodelink = curr
  end

  def remove_at(index)
    prev, curr = self.at(index-1), self.at(index)
    prev.nodelink = curr.nodelink
  end

  def size
    puts "The size of your Linked List is - [#{@size}]"
  end
  
  def head
    puts "First element value in your Linked List is - [#{@head.value}]"
  end

  def tail
    pointer = @head
    until pointer.nodelink == nil
      pointer = pointer.nodelink
    end
    puts "Last element value in your Linkest list is - [#{pointer.value}]"
  end

  def at(index)
    return p "ERROR: Wrong index" if index >= @size
    pointer = @head
    index.times { pointer = pointer.nodelink }
    pointer
  end

  def contains?(value, iteration=0)
    return p false if iteration == @size
    self.at(iteration).value == value ? p(true) : self.contains?(value, iteration + 1)
  end

  def find(value, iteration=0)
    return p nil if iteration == @size
    self.at(iteration).value == value ? p(iteration) : self.find(value, iteration + 1)
  end

  def to_s
    pointer = @head
    string = ""
    until pointer == nil
      string << ("( #{pointer.value} ) -> ")
      pointer = pointer.nodelink
    end
    string << "nil"
  end
  
end

class Node
  attr_reader :value
  attr_accessor :nodelink 

  def initialize(val=nil, nextnode=nil)
    @value = val
    @nodelink = nextnode
  end

end

linked_list = LinkedList.new

linked_list.append("Minecraft")
linked_list.prepend("Portal 2")
linked_list.size
linked_list.insert_at("Payday", 2)
puts linked_list
linked_list.prepend("Taco Hemingway")
linked_list.contains?("Taco Hemingway")
p linked_list.at(2)
linked_list.find("Payday")
puts linked_list
linked_list.pop
linked_list.head
linked_list.tail