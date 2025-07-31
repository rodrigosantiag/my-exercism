class Sieve
  def initialize(target)
    @target = target
  end

  def primes
    sieve = Array.new(@target + 1, true)
    sieve[0] = false
    sieve[1] = false
    result = []

    (2..Math.sqrt(@target).to_i).each do |i|
      next unless sieve[i] == true

      (i * i).step(@target, i).each do |j|
        sieve[j] = false
      end
    end

    (2..@target).each { |number| result << number if sieve[number] == true }
    result
  end
end
