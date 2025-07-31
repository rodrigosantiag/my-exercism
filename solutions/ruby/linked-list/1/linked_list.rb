class Deque
  def initialize
    @list = []
  end

  def push(value)
    @list.push(value)
  end

  def pop
    @list.pop
  end

  def shift
    @list.shift
  end

  def unshift(value)
    @list.unshift(value)
  end
end
