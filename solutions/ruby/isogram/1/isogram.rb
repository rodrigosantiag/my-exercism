# frozen_string_literal: true

module Isogram
  def self.isogram?(word)
    word = word.downcase.gsub(/\W+/, '')

    word.each_char { |letter| return false if word.count(letter) > 1 }

    true
  end
end
