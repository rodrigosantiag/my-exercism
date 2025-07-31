class Affine
  ALPHABET = ('a'..'z').to_a

  def initialize(key_a, key_b)
    @key_m = ALPHABET.size

    raise ArgumentError unless key_a.gcd(@key_m) == 1

    @key_a = key_a
    @key_b = key_b
  end

  def encode(plaintext)
    plaintext = plaintext.gsub(/[^a-zA-Z0-9]/, '').downcase
    result = ''

    plaintext.each_char do |char|
      result << encryption_equation(char)
      result << ' ' if (result.gsub(' ', '').size % 5).zero?
    end

    result.strip
  end

  def decode(ciphertext)
    ciphertext = ciphertext.gsub(/[^a-zA-Z0-9]/, '').downcase
    result = ''

    ciphertext.each_char do |char|
      result << decryption_equation(char)
    end

    result.strip
  end

  private

  def encryption_equation(char)
    char_index = ALPHABET.find_index(char)

    return char if char_index.nil?

    result_index = (@key_a * char_index + @key_b) % @key_m

    ALPHABET[result_index]
  end

  def decryption_equation(char)
    char_index = ALPHABET.find_index(char)

    return char if char_index.nil?

    mmi = mod_inverse(@key_a, @key_m)

    result_index = mmi * (char_index - @key_b) % @key_m

    ALPHABET[result_index]
  end

  def extended_gcd(a, b)
    if b.zero?
      [a, 1, 0]
    else
      gcd, x1, y1 = extended_gcd(b, a % b)
      x = y1
      y = x1 - (a / b) * y1
      [gcd, x, y]
    end
  end

  def mod_inverse(a, m)
    gcd, x, = extended_gcd(a, m)
    if gcd != 1
      raise ArgumentError, 'Modular inverse does not exist'
    else
      x % m
    end
  end
end
