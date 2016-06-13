class Node
  attr_accessor :key,:next_node
  
  def initialize(k=0)
    @key = k
    @next_node = nil
  end
end

class Linked
  attr_reader :root
  def initialize(root)
    @root = root
  end
  
  def parse
    visited = Array.new
    current = self.root
    list = Array.new
    while !(current.nil? || (visited.include? current))
      list << current.key
      visited << current
      current = current.next_node
    end
    return list
  end
  
  def simple_reverse
    list = self.parse
    return list.reverse
  end
  
  def largest_element
    self.parse.max
  end
  
  def smallest_element
    self.parse.min
  end
  
  def is_loop_present
    visited = Array.new
    current = self.root
    while !current.nil?
      if (visited.include? current)
        return true
      end
      visited << current
      current = current.next_node
    end
    return false
  end
  
  def is_loop_present_double_pointer
    current = self.root
    slow = current
    fast = current.next_node
    while slow == fast
      slow = slow.next_node
      fast = fast.next_node
    end
    slow = self.root
    while slow == fast
      slow = slow.next_node
      fast = fast.next_node
    end
    return slow.key
  end
end

root = Node.new(5)
linked = Linked.new(root)
parent = root
[6,7,8].each do |k|
  parent.next_node = Node.new(k)
  parent = parent.next_node
end
parent.next_node = root
puts "Linked list parse : #{linked.parse.join('->')}"
puts "Linked list simple reverse : #{linked.simple_reverse.join('->')}"
puts "is_loop_present : #{linked.is_loop_present}"
puts "is_loop_present_double_pointer : #{linked.is_loop_present_double_pointer}"