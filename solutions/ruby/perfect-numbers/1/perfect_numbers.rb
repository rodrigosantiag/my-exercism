module PerfectNumber
  def self.classify(number)
    raise RuntimeError if number.negative?

    factors = get_factors(number)

    return 'abundant' if factors.sum > number

    return 'deficient' if factors.sum < number

    'perfect'
  end

  def self.get_factors(number)
    (1..(number / 2)).select { |i| (number % i).zero? }
  end
end
