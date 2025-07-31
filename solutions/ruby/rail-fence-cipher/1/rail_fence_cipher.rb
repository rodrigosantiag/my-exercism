module RailFenceCipher
  def self.encode(text, rails)
    return text if rails == 1

    fence = Array.new(rails) { Array.new(text.length, ' ') }
    row, direction = 0, 1

    text.length.times do
      fence[row][fence[row].index(' ')] = '?'
      row += direction
      direction = -1 if row == 0 || row == rails - 1
    end

    fence.map { |row| row.join }.join
  end

  def self.decode(text, rails)
    return text if rails == 1

    rail_lengths = Array.new(rails, 0)
    rail_index = 0
    direction = 1

    text.chars.each do |char|
      rail_lengths[rail_index] += 1
      rail_index += direction
      direction = -direction if rail_index == 0 || rail_index == rails - 1
    end

    fence = Array.new(rails) { Array.new(text.length, ' ') }
    rail_index = 0
    index = 0

    text.chars.each do |char|
      fence[rail_index][index] = '?'
      rail_index += direction
      direction = -direction if rail_index == 0 || rail_index == rails - 1
      index += 1
    end

    index = 0

    text.chars.each do |char|
      fence[rail_index][fence[rail_index].index('?')] = char
      rail_index += direction
      direction = -direction if rail_index == 0 || rail_index == rails - 1
      index += 1
    end

    decoded_text = ''
    rail_index = 0
    index = 0

    text.chars.each do |char|
      decoded_text << fence[rail_index][index]
      rail_index += direction
      direction = -direction if rail_index == 0 || rail_index == rails - 1
      index += 1
    end

    decoded_text.gsub('?', '')
  end












end
