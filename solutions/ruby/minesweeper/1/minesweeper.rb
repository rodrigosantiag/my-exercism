class Minesweeper
  def self.annotate(input)
    num_rows = input.size

    input.each_with_index do |row, i|
      row.each_char.with_index do |char, j|
        if char == ' '
          num_cols = row.size
          mines_around = 0

          if j.positive? && row[j - 1] == '*'
            mines_around += 1
          end

          if j < num_cols - 1 && row[j + 1] == '*'
            mines_around += 1
          end

          mines_around += count_mines_around(input[i + 1], j) if i < num_rows - 1
          mines_around += count_mines_around(input[i - 1], j) if i.positive?
          input[i][j] = mines_around.to_s if mines_around.positive?
        end
      end
    end

    input
  end

  def self.count_mines_around(row, position)
    num_cols = row.size
    count_mines = row[position] == '*' ? 1 : 0

    if position.positive? && row[position - 1] == '*'
      count_mines += 1
    end

    if position < num_cols - 1 && row[position + 1] == '*'
      count_mines += 1
    end

    count_mines
  end
end
