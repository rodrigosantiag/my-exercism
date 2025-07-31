module Transpose
  def self.transpose(input)
    return '' if input.empty?

    sentences = input.split("\n")
    longest = sentences.map(&:length).max
    result = sentences.map do |line|
      line.ljust(longest).chars
    end

    result = result.transpose.map(&:join)
    # result = Array.new(longest) { |i| sentences.map { |line| line[i] || ' ' }.join }

    # sentences.each do |sentence|
    #   sentence.chars.each_with_index do |char, idx|
    #     result[idx] += char
    #   end
    #
    #   (sentence.length...longest).each do |idx|
    #     result[idx] += ' '
    #   end
    # end

    result.join("\n")
  end
end
