module CollatzConjecture
  def self.steps(number)
    raise ArgumentError if number < 1

    steps = 0

    while number != 1
      number = if (number % 2).zero?
                 number / 2
               else
                 3 * number + 1
               end
      steps += 1
    end

    steps
  end
end
