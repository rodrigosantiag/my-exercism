# frozen_string_literal: true

module Grid
  def self.saddle_points(inputs)
    result = []

    inputs.each_with_index do |row, idx|
      tallest_in_row_indexes = get_tallest_indexes_in_row(row)

      tallest_in_row_indexes.each do |tallest_in_row_index|
        potential_saddle_point = [idx + 1, tallest_in_row_index + 1]
        result << {'row' => potential_saddle_point[0], 'column' => potential_saddle_point[1]} if the_smallest?(inputs, potential_saddle_point)
      end
    end

    result
  end

  def self.get_tallest_indexes_in_row(row)
    result = []
    highest = row.max

    row.each_with_index do |value, idx|
      result << idx if value == highest
    end

    result
  end

  def self.the_smallest?(inputs, coordinates)
    potential_row = coordinates[0] - 1
    potential_column = coordinates[1] - 1
    value = inputs[potential_row][potential_column]

    inputs.each_with_index do |row, idx|
      next if idx == potential_row

      return false if row[potential_column] < value
    end

    true
  end
end
