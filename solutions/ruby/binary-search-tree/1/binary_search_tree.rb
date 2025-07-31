class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(node)
    if node <= data
      left.nil? ? self.left = Bst.new(node) : left.insert(node)
    else
      right.nil? ? self.right = Bst.new(node) : right.insert(node)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    left&.each(&block)
    block.call(data)
    right&.each(&block)
  end
end
