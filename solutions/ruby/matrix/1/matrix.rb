# frozen_string_literal: true

class Matrix
  def initialize(matrix)
    @matrix = []
    rows = matrix.split("\n")

    rows.each { |row| @matrix << row.split(" ").map(&:to_i) }
  end

  def row(row_number)
    @matrix[row_number - 1]
  end

  def column(column_number)
    result = []

    @matrix.each do |row|
      row.each_with_index do |column, idx|
        result << column if idx == column_number - 1
      end
    end

    result
  end
end
