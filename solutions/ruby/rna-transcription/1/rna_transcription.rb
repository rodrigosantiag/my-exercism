# frozen_string_literal: true

RNA_TRANSCRIPTION = {
  'G': 'C',
  'C': 'G',
  'T': 'A',
  'A': 'U'
}.freeze

# module RNA
module Complement
  def self.of_dna(dna)
    result = ''

    dna.each_char { |char| result += RNA_TRANSCRIPTION[char.to_sym]}

    result
  end
end
