module PerfectNumber
  def self.classify(number)
    raise RuntimeError if number.negative?

    factors_sum = get_factors_sum(number)

    return 'abundant' if factors_sum > number

    return 'deficient' if factors_sum < number

    'perfect'
  end

  def self.get_factors_sum(number)
    (1..(number / 2)).select { |i| (number % i).zero? }.sum
  end
end
