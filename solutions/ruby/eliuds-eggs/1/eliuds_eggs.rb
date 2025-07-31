module EliudsEggs
  def self.egg_count(amount)
    amount.to_s(2).count('1')
  end
end
