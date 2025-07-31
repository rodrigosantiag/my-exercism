module Hamming
  def self.compute(sequence_1, sequence_2)
    raise ArgumentError if sequence_1.size != sequence_2.size

    count = 0

    sequence_1.split('').each_with_index { |char, idx| count += 1 if char != sequence_2[idx] }

    count
  end
end
