class Cipher
  attr_reader :key

  ALPHABET = ('a'..'z').to_a.join.freeze

  def initialize(key = nil)

    raise ArgumentError if !key.nil? && !/^[a-z]+$/.match?(key)

    @key = key.nil? ? ALPHABET : key
  end

  def encode(plaintext)
    result = ''

    plaintext.chars.each_with_index do |char, idx|
      key_char = @key[idx]
      key_position = ALPHABET.index(key_char)
      new_position = (ALPHABET.index(char) + key_position) % ALPHABET.size
      result += ALPHABET[new_position]
    end

    result
  end

  def decode(plaintext)
    result = ''

    plaintext.chars.each_with_index do |char, idx|
      key_char = @key[idx]
      key_position = ALPHABET.index(key_char)
      char_position = ALPHABET.index(char)
      new_position = (char_position - key_position) % ALPHABET.size
      result += ALPHABET[new_position]
    end

    result
  end
end
