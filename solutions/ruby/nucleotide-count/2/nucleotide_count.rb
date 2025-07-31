class Nucleotide
  ALLOWED = %w[A C G T].freeze

  def initialize(sequence)
    @sequence = sequence
  end

  def self.from_dna(sequence)
    sequence.each_char { |char| raise ArgumentError if !ALLOWED.include?(char) || sequence.empty? }
    Nucleotide.new(sequence)
  end

  def count(char)
    @sequence.count(char)
  end

  def histogram
    result = { 'A' => 0, 'C' => 0, 'G' => 0, 'T' => 0 }

    @sequence.chars.each { |char| result[char] += 1 }

    result
  end
end
