# frozen_string_literal: true

DNA = 'GCTA'
RNA = 'CGAU'

# module RNA
module Complement
  def self.of_dna(dna)
    dna.tr(DNA, RNA)
  end
end
