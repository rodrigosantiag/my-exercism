class Series
  def initialize(sequence)
    raise ArgumentError if !sequence.scan(/\D/).empty? || sequence.empty?

    @sequence = sequence
  end

  def largest_product(series)
    raise ArgumentError if @sequence.length < series || series.negative?

    @sequence.each_char.each_cons(series).map { |chars| chars.map(&:to_i).reduce(:*) }.max
  end
end
