module Brackets
  BRACKET_RELATIONS = { '(': ')', '[': ']', '{': '}' }.freeze

  def self.paired?(string)
    result = []

    string.each_char do |letter|
      if BRACKET_RELATIONS.include? letter.to_sym
        result << letter
      elsif BRACKET_RELATIONS.value? letter
        return false unless result[-1] == BRACKET_RELATIONS.key(letter).to_s

        result.pop
      end
    end

    result.empty?
  end
end
