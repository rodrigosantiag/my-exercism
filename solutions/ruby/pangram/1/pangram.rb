module Pangram
  LETTERS_COUNT = 26

  def self.pangram?(sentence)
    sentence = sentence.downcase.gsub(/[^a-zA-Z]/, '')
    result = Set.new

    sentence.each_char {|char| result.add(char) }

    result.size == LETTERS_COUNT
  end
end
