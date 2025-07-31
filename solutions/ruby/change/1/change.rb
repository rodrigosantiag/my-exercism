class Change
  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  def self.generate(coins, target)
    raise NegativeTargetError if target.negative?
    return [] if target.zero?

    min_coins = [0] * (target + 1)
    last_coin = [0] * (target + 1)

    (1..target).each do |i|
      min_coins[i] = Float::INFINITY
      coins.each do |coin|
        next if coin > i

        if 1 + min_coins[i - coin] < min_coins[i]
          min_coins[i] = 1 + min_coins[i - coin]
          last_coin[i] = coin
        end
      end
    end

    raise ImpossibleCombinationError if min_coins[target] == Float::INFINITY

    result = []
    while target > 0
      coin = last_coin[target]
      result << coin
      target -= coin
    end
    result
  end
end
