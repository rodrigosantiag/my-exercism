module RotationalCipher
  ALPHABET = ('a'..'z').to_a

  def self.rotate(sentence, key)
    result = ''

    sentence.each_char.with_index do |char, idx|
      if ALPHABET.include?(char.downcase)
        index = (ALPHABET.index(char.downcase) + key) % ALPHABET.length
        char = ALPHABET[index]
        char = char.upcase if upper?(sentence[idx])
      end

      result += char
    end

    result
  end

  def self.upper?(char)
    char.upcase == char
  end
end
