# frozen_string_literal: true

FACTORS = {
  3 => 'Pling',
  5 => 'Plang',
  7 => 'Plong'
}.freeze

# Raindrops module
module Raindrops
  def self.convert(number)
    result = ''

    FACTORS.each do |key, value|
      result += value if (number % key).zero?
    end

    result.empty? ? number.to_s : result
  end
end
