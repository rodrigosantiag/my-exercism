module PythagoreanTriplet
  def self.triplets_with_sum(number)
    a_limit = (number / 3)
    result = []

    (1..a_limit).each do |a|
      b = (number**2 - 2 * number * a) / (2 * number - 2 * a)
      c = number - (a + b)

      result << [a, b, c].sort
    end

    result.select { |first, second, third| first < second && second < third && first**2 + second**2 == third**2}.uniq
  end
end
