module Alphametics
  def self.solve(puzzle)
    words = puzzle.scan(/[A-Z]+/)
    unique_letters = words.join.chars.uniq
    first_letters = words.map { |word| word[0] }.uniq

    # Generate all possible permutations of digits for unique letters
    (0..9).to_a.permutation(unique_letters.size) do |digits|
      letter_to_digit = Hash[unique_letters.zip(digits)]
      next if first_letters.any? { |letter| letter_to_digit[letter] == 0 } # Skip if any leading digit is zero

      translated_words = words.map { |word| word.chars.map { |letter| letter_to_digit[letter] }.join.to_i }
      next unless translated_words[0..-2].sum == translated_words[-1] # Check if the sum is valid

      return letter_to_digit
    end

    return {}
  end
end
