# frozen_string_literal: true

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(capacity)
    @elements = Array.new(capacity)
    @head = 0
    @size = 0
    @capacity = capacity
  end

  def read
    raise BufferEmptyException if @size.zero?

    tail = (@size - @head).abs % @capacity
    @size -= 1

    @elements[tail]
  end

  def write(item)
    raise BufferFullException if is_full?

    @elements[@head % @elements.size] = item

    @head += 1
    @size += 1
  end

  def write!(item)
    read if is_full?
    write(item)
  end

  def clear
    @head = 0
    @size = 0
  end

  private

  def is_full?
    @size == @capacity
  end
end
