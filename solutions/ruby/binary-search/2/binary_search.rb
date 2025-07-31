class BinarySearch
  def initialize(numbers)
    @numbers = numbers
  end

  def search_for(number)
    first = 0
    last = @numbers.size

    while first < last
      middle = (first + last) / 2
      middle_number = @numbers[middle]

      if number < middle_number
        last = middle
      elsif  number > middle_number
        first = middle + 1
      else
        return middle
      end
    end

    nil
  end
end
