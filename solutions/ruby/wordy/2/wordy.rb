class WordProblem
  def initialize(input)
    @input = input.downcase
  end

  def answer
    raise ArgumentError unless @input.start_with?('what is ')

    operation_input = @input.gsub('what is ', '').gsub('by', '').gsub('?', '')

    operation_input = operation_input.split
    numbers = []
    operations = []

    operation_input.each do |input|
      if input.to_i.to_s == input
        numbers << input.to_i
      elsif self.operations.include? input
        operations << input
      else
        raise ArgumentError
      end
    end

    result = numbers.shift.to_i

    while numbers.size > 0
      number = numbers.shift
      operation = operations.shift

      result = self.send(operation.to_sym, *[result, number])
    end

    result
  end

  private

  def operations
    %w[plus minus divided multiplied]
  end

  def plus(a, b)
    a + b
  end

  def minus(a, b)
    a - b
  end

  def divided(a, b)
    a / b
  end

  def multiplied(a, b)
    a * b
  end
end
