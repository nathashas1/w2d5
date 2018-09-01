class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @next = nil
    @prev = nil
  end
end

class LinkedList
  attr_accessor :head , :tail

  def initialize
    @head = Node.new
    @tail = Node.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self.head
  end

  def last
    self.tail
  end

  def empty?
    self.head.next.nil?
  end

  def get(key)
    self
  end

  def include?(key)
    each_with_index {|link,j| link.val.include?(key)}
  end

  def append(key, val)
    new_node = Node.new(key,val)
    @head.next = new_node
    @tail.prev = new_node
    new_node.prev = @head
    new_node.next = @tail
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
