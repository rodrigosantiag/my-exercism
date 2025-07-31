class Phrase
  def initialize(subtitle)
    @subtitle = subtitle
  end

  def word_count
    word_counts = Hash.new(0)
    words = @subtitle.downcase.scan(/\b[\w']+\b/)
    words.each { |word| word_counts[word] += 1 }
    word_counts
  end
end
