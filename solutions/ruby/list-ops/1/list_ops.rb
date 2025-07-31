module ListOps
  def self.arrays(array)
    count = 0

    array.each { |_| count += 1 }

    count
  end

  def self.reverser(array)
    result = Array.new(arrays(array))
    position = -1

    array.each do |item|
      result[position] = item
      position -=1
    end

    result
  end

  def self.concatter(array1, array2)
    result = Array.new(arrays(array1) + arrays(array2))
    position = 0

    array1.each do |item|
      result[position] = item
      position += 1
    end

    array2.each do |item|
      result[position] = item
      position += 1
    end

    result
  end

  def self.mapper(array, &block)
    result = Array.new(arrays(array))

    array.each_with_index { |item, idx| result[idx] = block.call(item) }

    result
  end

  def self.filterer(array, &function)
    mapped = mapper(array, &function)
    result = []

    array.each_with_index { |item, idx| result << item if mapped[idx] }

    result
  end

  def self.sum_reducer(array)
    result = 0

    array.each { |item| result += item}

    result
  end

  def self.factorial_reducer(array)
    result = 1

    array.each { |item| result *= item}

    result
  end
end
