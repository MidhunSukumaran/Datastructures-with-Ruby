class Node
  attr_accessor :key,:next_node,:prev_node
  
  def initialize(k=0)
    @key = k
    @next_node = nil
    @prev_node = nil
  end
end

class DoubleLinkedList
  attr_accessor :root
  def initialize(root)
    @root = root
  end
  
  def self.create_linear_list(array)
    root = Node.new(array.first)
    linked = self.new(root)
    prev = root
    array[1..-1].each do |k|
      current = Node.new(k)
      prev.next_node = current
      current.prev_node = prev
      puts "current: #{current.key}, prev : #{prev.key}"
      prev = current
    end
    return linked
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
  
  def reverse
    current = self.root
    temp = nil
    while !current.nil?
      puts "#{current.key}"
      temp = current.prev_node
      current.prev_node = current.next_node
      current.next_node = temp
      current = current.prev_node
    end
    self.root = temp.prev_node
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
  
  def get_loop_start_double_pointer
    current = self.root
    slow = current
    fast = current.next_node
    while fast && fast.next_node
      if slow == fast
        break
      end
      slow = slow.next_node
      fast = fast.next_node.next_node
    end
    if slow == fast
      slow = self.root
      while slow != fast.next_node
        slow = slow.next_node
        fast = fast.next_node
      end
    end
    return fast.key
  end
end

array = [5,6,7,8,9]
linked = DoubleLinkedList.create_linear_list(array)
puts "Linked list parse : #{linked.parse.join('<=>')}"
linked.reverse
puts "Linked list parse : #{linked.parse.join('<=>')}"
#puts "Linked list simple reverse : #{linked.simple_reverse.join('->')}"
#puts "is_loop_present : #{linked.is_loop_present}"
#puts "is_loop_present_double_pointer : #{linked.get_loop_start_double_pointer}"