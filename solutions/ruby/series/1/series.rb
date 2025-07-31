class Series
  attr_reader :series

  def initialize(series)
    @series = series.each_char.map { |char| char }
  end

  def slices(number)
    raise ArgumentError if number <= 0 || @series.size < number

    result = []

    @series.each_index do |index|
      current_series = @series.slice(index, number).join

      result << current_series if current_series.size == number
    end

    result.flatten
  end
end
