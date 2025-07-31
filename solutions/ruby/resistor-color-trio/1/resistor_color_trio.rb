class ResistorColorTrio
  def initialize(colors)
    @colors = colors
    @values = {
      'black': '0',
      'brown': '1',
      'red': '2',
      'orange': '3',
      'yellow': '4',
      'green': '5',
      'blue': '6',
      'violet': '7',
      'grey': '8',
      'white': '9',
    }
  end

  def label
    result = @values[@colors[0].to_sym] + @values[@colors[1].to_sym]

    result += '0' * @values[@colors[2].to_sym].to_i
    suffix = 'ohms'
    prefix = ''

    int_result = result.to_i
    final_result = int_result

    if (int_result % 10**9).zero?
      final_result = int_result / 10**9
      prefix = 'giga'
    elsif (int_result % 10**6).zero?
      final_result = int_result / 10**6
      prefix = 'mega'
    elsif (int_result % 10**3).zero?
      final_result = int_result / 10**3
      prefix = 'kilo'
    end

    "Resistor value: #{final_result} #{prefix}#{suffix}"
  end
end
