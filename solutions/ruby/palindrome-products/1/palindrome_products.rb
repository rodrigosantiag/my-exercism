require 'prime'

class Palindromes
  attr_reader :palindromes, :min_factor, :max_factor

  def initialize(**args)
    @max_factor = args[:max_factor]
    @min_factor = args.fetch(:min_factor, 1)
    @palindromes = []
  end

  def generate
    (@min_factor..@max_factor).each do |factor_1|
      result_pow = factor_1 * factor_1
      @palindromes << result_pow if palindrome?(result_pow)

      (factor_1+1..@max_factor).each do |factor_2|
        result = factor_1 * factor_2
        @palindromes << result if palindrome?(result)
      end
    end

    @palindromes
  end

  def largest
    value = @palindromes.max
    PalindromeNumber.new(min_factor: @min_factor, max_factor: @max_factor, value: value)
  end

  def smallest
    value = @palindromes.min
    PalindromeNumber.new(min_factor: @min_factor, max_factor: @max_factor, value: value)
  end

  private

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end

class PalindromeNumber < Palindromes
  attr_reader :value

  def initialize(**args)
    super
    @value = args[:value]
  end

  def factors
    result = []

    (@min_factor..@max_factor).each do |factor_1|
      (factor_1..@max_factor).each do |factor_2|
        result << [factor_1, factor_2] if factor_1 * factor_2 == @value
      end
    end

    result
  end
end
