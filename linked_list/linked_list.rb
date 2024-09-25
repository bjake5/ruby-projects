class LinkedList

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      last_node = @tail
      last_node.next_node = node
      @tail = node
    end
    puts node
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      first_node = @head
      node.next_node = node
      @head = node
    end
    puts node
  end

  def size
    current_node = @head
    size = 0
    return size if current_node.nil?

    size += 1
    next_node = current_node.next_node
    until current_node.next_node.nil?
      current_node = next_node
      next_node = current_node.next_node
      size += 1
    end
    size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current_node = @head
    next_node = current_node.next_node
    value_at = nil
    i = 0
    while i < index do
      current_node = next_node
      next_node = current_node.next_node
      i += 1
    end
    current_node
  end

  def pop
    current_node = @head
    return nil if current_node.nil?

    if current_node.next_node.nil?
      @head = nil
      @tail = nil
      current_node = nil
      return nil
    end

    next_node = current_node.next_node
    until current_node.next_node == @tail
      current_node = next_node
      next_node = current_node.next_node
    end

    next_node = nil
    current_node.next_node = nil
    @tail = current_node
  end

  def contains(value)
    current_node = @head

    until current_node == @tail do
      if current_node.value == value
        return true
      else
        current_node = current_node.next_node
      end
    end

    if current_node == @tail && current_node.value == value
      return true
    end
    false
  end

  def find(value)
    current_node = @head

    until current_node == @tail do
      if current_node.value == value
        return current_node
      else
        current_node = current_node.next_node
      end
    end

    if current_node == @tail && current_node.value == value
      return current_node
    end
    nil
  end

  def to_s
    current_node = @head
    arr = []
    until current_node == @tail || current_node.nil? do
      arr << "( #{current_node.value} )"
      current_node = current_node.next_node
    end
    if current_node == @tail && !current_node.nil?
      arr << "( #{current_node.value} )"
    end
    arr << "nil" 
    puts arr.join(" -> ")
  end

end