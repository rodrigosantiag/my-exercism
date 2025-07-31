COMMAND_LIST = ['wink', 'double blink', 'close your eyes', 'jump', 'reverse'].freeze

class SecretHandshake
  def initialize(input)
    @input = input
  end

  def commands
    return [] if !@input.is_a?(Integer) || @input < 1 || @input > 31

    binary = @input.to_s(2)
    result = []

    binary.reverse.chars.each_with_index do |digit, idx|
      next if digit == '0'

      command = COMMAND_LIST[idx.to_i]
      command == 'reverse' ? result.reverse! : result << command
    end

    result
  end
end
