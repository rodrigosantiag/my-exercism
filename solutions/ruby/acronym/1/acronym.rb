# frozen_string_literal: true

module Acronym
  def self.abbreviate(word)
    words = word.split(/[ ,-]/)

    words.map { |w| w.capitalize[0] }.join
  end
end
