class Anagram
  def initialize(word)
    @word = word.downcase
    @normalized_word = @word.chars.sort.join
  end

  def match(candidates)
    result = []

    candidates.each do |candidate|
      if candidate.downcase.chars.sort.join == @normalized_word && @word != candidate.downcase
        result << candidate
      end
    end

    result
  end
end
