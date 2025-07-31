class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)

    arguments_valid = first_operand.is_a?(Integer) && second_operand.is_a?(Integer) && operation.is_a?(String)

    raise ArgumentError unless arguments_valid

    begin
      result = if operation == '+'
                 first_operand + second_operand
               elsif operation == '/'
                 first_operand / second_operand
               else
                 first_operand * second_operand
               end
    rescue ZeroDivisionError
      return 'Division by zero is not allowed.'
    end

    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end

  class UnsupportedOperation < StandardError
  end
end
