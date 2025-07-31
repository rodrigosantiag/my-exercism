class Allergies
  ALLERGENS = {
    'eggs' => 1,
    'peanuts' => 2,
    'shellfish' => 4,
    'strawberries' => 8,
    'tomatoes' => 16,
    'chocolate' => 32,
    'pollen' => 64,
    'cats' => 128
  }.freeze

  def initialize(score)
    @score = score & 255
  end

  def allergic_to?(item)
    ALLERGENS[item] & @score != 0
  end

  def list
    ALLERGENS.keys.select { |item| allergic_to?(item) }
  end
end
