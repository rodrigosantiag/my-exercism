class SpiralMatrix
  def initialize(size)
    @size = size
  end

  def matrix
    result = Array.new(@size) { Array.new(@size) }
    current_value = 1
    top = 0
    bottom = @size - 1
    left = 0
    right = @size - 1
    direction = 'right'

    while top <= bottom && left <= right
      case direction
      when 'right'
        (left..right).each do |col|
          result[top][col] = current_value
          current_value += 1
        end

        direction = 'down'
        top += 1
      when 'down'
        (top..bottom).each do |row|
          result[row][right] = current_value
          current_value += 1
        end

        direction = 'left'
        right -= 1
      when 'left'
        (left..right).to_a.reverse.each do |col|
          result[bottom][col] = current_value
          current_value += 1
        end

        direction = 'up'
        bottom -= 1
      when 'up'
        (top..bottom).to_a.reverse.each do |row|
          result[row][left] = current_value
          current_value += 1
        end
        direction = 'right'
        left += 1
      else
        break
      end
    end

    result
  end
end
