class CustomSet
  attr_reader :set

  def initialize(set)
    @set = set
  end

  def empty?
    @set.empty?
  end

  def member?(element)
    @set.include?(element)
  end

  def subset?(other)
    @set.all? { |element| other.member?(element) }
  end

  def disjoint?(other)
    @set.none? { |element| other.member?(element) }
  end

  def ==(other)
    @set.sort == other.set.sort
  end

  def add(element)
    @set << element unless member?(element)
    self
  end

  def intersection(other)
    CustomSet.new(@set.select { |element| other.member?(element) })
  end

  def difference(other)
    CustomSet.new(@set.reject { |element| other.member?(element) })
  end

  def union(other)
    CustomSet.new((@set + other.set).uniq)
  end
end
