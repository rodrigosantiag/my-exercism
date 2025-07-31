class Element
  attr_accessor :datum, :next

  def initialize(datum)
    self.datum = datum
    self.next = nil
  end
end

class SimpleLinkedList
  attr_accessor :element

  def initialize(numbers=[])
    numbers = numbers.to_a if numbers.is_a?(Range)
    self.element = nil if numbers.empty?

    numbers.each do |number|
      element = Element.new(number)
      push(element)
    end
  end

  def push(new_element)
    new_element.next = element
    self.element = new_element
    self
  end

  def pop
    result = element
    self.element = element.next unless element.nil?

    result
  end

  def to_a
    result = []
    current_element = element

    loop do
      break if current_element.nil?

      result << current_element.datum

      current_element = current_element.next
    end

    result
  end

  def reverse!
    prev_element = nil
    current = element

    until current.nil?
      next_element = current.next
      current.next = prev_element
      prev_element = current
      current = next_element
    end

    self.element = prev_element
    self
  end
end
