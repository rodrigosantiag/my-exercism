class BaseConverter
  def self.convert(input_base, digits, output_base)
    # Check for invalid input and output bases
    raise ArgumentError, 'Invalid input base' unless valid_base?(input_base)
    raise ArgumentError, 'Invalid output base' unless valid_base?(output_base)

    # Check for negative digits or invalid positive digits
    raise ArgumentError, 'Invalid digit' unless valid_digits?(digits, input_base)

    # Convert input digits to base 10
    base_10_value = convert_to_base_10(digits, input_base)

    # Convert the base 10 value to the output base
    converted_digits = convert_to_target_base(base_10_value, output_base)

    return converted_digits
  end

  def self.valid_base?(base)
    base > 1
  end

  def self.valid_digits?(digits, input_base)
    return false if digits.any? { |digit| digit.negative? || digit >= input_base }
    true
  end

  def self.convert_to_base_10(digits, input_base)
    base_10_value = 0
    power = digits.length - 1

    digits.each do |digit|
      base_10_value += digit * (input_base**power)
      power -= 1
    end

    base_10_value
  end

  def self.convert_to_target_base(base_10_value, output_base)
    return [0] if base_10_value.zero?

    converted_digits = []
    while base_10_value > 0
      remainder = base_10_value % output_base
      converted_digits.unshift(remainder)
      base_10_value /= output_base
    end

    converted_digits
  end
end
