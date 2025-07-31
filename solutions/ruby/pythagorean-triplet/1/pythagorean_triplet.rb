module PythagoreanTriplet
  def self.triplets_with_sum(number)
    result = []

    (1..number).each do |a|
      (a..number).each do |b|
        c_squared = a**2 + b**2
        c = Math.sqrt(c_squared).to_i

        result << [a, b, c] if c**2 == c_squared && (a + b + c) == number
      end
    end

    result
  end
end
