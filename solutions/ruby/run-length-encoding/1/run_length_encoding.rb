module RunLengthEncoding
  def self.encode(input)
    return '' if input.empty?

    result = ''
    current_char = input[0]
    current_count = 1

    input[1..].each_char do |char|
      if char == current_char
        current_count += 1
      else
        result += "#{current_count if current_count > 1}#{current_char}"
        current_char = char
        current_count = 1
      end
    end

    result += "#{current_count if current_count > 1}#{current_char}"

    result
  end

  def self.decode(input)
    return '' if input.empty?

    result = ''
    current_count = ''

    input.each_char do |char|
      if digit?(char)
        current_count += char
      else
        result += digit?(current_count) ? char * current_count.to_i : char
        current_count = ''
      end
    end

    result
  end

  def self.digit?(char)
    !!Integer(char)
  rescue StandardError
    false
  end
end
