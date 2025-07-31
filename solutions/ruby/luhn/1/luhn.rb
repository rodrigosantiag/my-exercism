# frozen_string_literal: true
module Luhn
  def self.valid?(word)
    word = word.gsub(/\s+/, '')
    return false if (word.length <= 1) || !word.match?(/\A[\d\s]+\z/)

    word = word.scan(/\d/).join('')
    word.reverse!
    total = 0

    (1...word.length).step(2).each do |idx|
      digit = word[idx].to_i
      digit *= 2
      digit -= 9 if digit > 9
      word[idx] = digit.to_s
    end

    word.each_char { |char| total += char.to_i}

    (total % 10).zero? ? true : false
  end
end
