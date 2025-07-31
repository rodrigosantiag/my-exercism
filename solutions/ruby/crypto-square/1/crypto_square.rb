class Crypto
  def initialize(plaintext)
    @plaintext = plaintext.downcase.gsub(/[^a-z0-9]/, '')
    input_size = @plaintext.size
    square = Math.sqrt(input_size).round
    @column, @row = get_col_and_row(input_size, square, square)
  end

  def ciphertext
    return '' if @column.zero?

    rectangle = @plaintext.chars.each_slice(@column).map(&:join).map { |item| item.ljust(@column, ' ') }
    result = []

    (0...@column).each do |idx|
      current_string = ''
      rectangle.each { |item| current_string += item[idx] }
      result << current_string
    end

    result.join ' '
  end

  private

  def get_col_and_row(size, col, row)
    return [col, row] if row * col >= size && col >= row && col - row <= 1

    col += 1
    row += 1 if col - row > 1
    get_col_and_row(size, col, row)
  end
end
