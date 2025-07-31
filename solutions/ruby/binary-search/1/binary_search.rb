class BinarySearch
  def initialize(numbers)
    @numbers = numbers
  end

  def search_for(number)
    @numbers.index(number)
  end
end
