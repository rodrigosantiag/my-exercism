# frozen_string_literal: true

# Resistor color module
module ResistorColor
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def self.color_code(code)
    COLORS.find_index(code)
  end
end
