class Triangle
  def initialize(sides)
    @sides = sides
    @side_a, @side_b, @side_c = sides
  end

  def equilateral?
    is_triangle? && @side_a == @side_b && @side_b == @side_c
  end

  def isosceles?
    is_triangle? && (@side_a == @side_b || @side_a == @side_c || @side_b == @side_c)
  end

  def scalene?
    is_triangle? && !isosceles? && !equilateral?
  end

  private

  def is_triangle?
    higher_than_zero = @sides.all? { |item| !item.zero? }
    higher_than_zero && @side_a + @side_b >= @side_c && @side_a + @side_c >= @side_b && @side_b + @side_c >= @side_a
  end
end
