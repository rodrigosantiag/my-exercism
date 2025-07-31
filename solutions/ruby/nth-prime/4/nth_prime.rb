module Prime
  def self.nth(number)
    raise ArgumentError if number < 1

    current_number = 1
    count = 0
    result = nil

    while count < number
      if is_prime?(current_number)
        count += 1
        result = current_number
      end

      current_number += 1
    end

    result
  end

  def self.is_prime?(number)
    if number <= 1
      return false
    elsif [2, 3].include?(number)
      return true
    elsif number.even? || (number % 3).zero?
      return false
    end

    (5..Math.sqrt(number).to_i).each do |factor|
      return false if (number % factor).zero? && factor != 1
    end

    true
  end
end
