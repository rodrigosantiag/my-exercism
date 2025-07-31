# frozen_string_literal: true

module ResistorColorDuo
  RESISTANCES = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }.freeze

  def self.value(colors)
    relevant_colors = colors[0, 2]

    (RESISTANCES[relevant_colors[0].to_sym].to_s + RESISTANCES[relevant_colors[1].to_sym].to_s).to_i
  end
end
