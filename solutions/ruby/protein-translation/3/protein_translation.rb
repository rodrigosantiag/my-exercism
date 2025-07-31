TRANSLATION = {
  'AUG' => 'Methionine',
  'UUU' => 'Phenylalanine',
  'UUC' => 'Phenylalanine',
  'UUA' => 'Leucine',
  'UUG' => 'Leucine',
  'UCU' => 'Serine',
  'UCC' => 'Serine',
  'UCA' => 'Serine',
  'UCG' => 'Serine',
  'UAU' => 'Tyrosine',
  'UAC' => 'Tyrosine',
  'UGU' => 'Cysteine',
  'UGC' => 'Cysteine',
  'UGG' => 'Tryptophan',
  'UAA' => 'STOP',
  'UAG' => 'STOP',
  'UGA' => 'STOP'
}.freeze

class InvalidCodonError < StandardError; end

module Translation
  def self.of_rna(strand)
    result = []

    strand.chars.each_slice(3) do |protein|
      protein = TRANSLATION[protein.join]
      raise InvalidCodonError if protein.nil?
      break if protein == 'STOP'

      result << protein
    end

    result
  end
end
