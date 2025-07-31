module ParallelLetterFrequency
  def self.count(texts)
    result = {}

    texts.each do |text|
      Thread.new {
        unicode_letters_regex = /[[:alpha:]\p{L}\p{M}]/u
        matches = text.scan(unicode_letters_regex)

        matches.each do |letter|
          letter = letter.downcase

          if result[letter].nil?
            result[letter] = 1
          else
            result[letter] += 1
          end
        end
      }.join
    end

    result
  end
end
