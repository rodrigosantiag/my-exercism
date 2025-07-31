module Atbash
  PLAIN = 'abcdefghijklmnopqrstuvwxyz'.freeze
  CIPHER = PLAIN.reverse.freeze

  def self.encode(text)
    space_counter = 1
    text = sanitize(text)
    result = ''

    text.each_char do |char|
      result += number?(char) ? char : CIPHER[PLAIN.index(char)]
      result += ' ' if (space_counter % 5).zero?
      space_counter += 1
    end

    result.strip
  end

  def self.decode(text)
    text = sanitize text
    result = ''
    text.each_char { |char| result += number?(char) ? char : CIPHER[PLAIN.index(char)] }
    result
  end

  def self.sanitize(text)
    text.gsub(/[^A-Za-z0-9]/, '').downcase
  end

  def self.number?(char)
    char.to_i.to_s == char
  end
end
