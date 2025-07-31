class Integer
  def to_roman
    raise ArgumentError if self > 3999

    number = self
    result = ''

    sign_values = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL',
                    10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }

    sign_values.each_key do |value|
      break if number.zero?

      next if self < value

      rest = number % value
      current_value = number - rest
      qty_signs = current_value / value

      result += qty_signs <= 3 ? sign_values[value] * qty_signs : sign_values[current_value]

      number = rest
    end

    result
  end
end
