class SumOfMultiples
  def initialize(*args)
    @base_values = *args
  end

  def to(level)
    result = []

    @base_values.each do |base_value|
      next if base_value <= 0

      factor = 1
      current_value = base_value

      while current_value < level
        result << current_value
        factor += 1
        current_value = base_value * factor
      end
    end

    result.uniq.sum
  end
end
