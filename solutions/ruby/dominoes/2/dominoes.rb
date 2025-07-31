module Dominoes
  def self.chain?(dominoes)
    dominoes.empty? || dominoes.permutation.any? do |part|
      part.each_cons(2).all? { |a, b| a[1] == b[0] || a[1] == b.reverse![0] } && part[0][0] == part[-1][-1]
    end
  end
end
