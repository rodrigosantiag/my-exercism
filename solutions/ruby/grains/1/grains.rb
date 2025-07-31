module Grains
  GRAINS = [1]
  (1..63).each { |idx| GRAINS << GRAINS[idx - 1] * 2}

  def self.square(number)
    raise ArgumentError if number <= 0 || number > 64

    GRAINS[number - 1]
  end

  def self.total
    GRAINS.sum
  end
end
