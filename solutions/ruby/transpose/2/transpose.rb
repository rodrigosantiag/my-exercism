module Transpose
  def self.transpose(input)
    strings = input.gsub(' ', '_').split("\n").map(&:chars)
    max_length = strings.map(&:length).max
    strings.map { |line| line + ([' '] * (max_length - line.length)) }
           .transpose
           .map { |line| line.join.rstrip.gsub('_', ' ') }
           .join("\n")
  end
end
