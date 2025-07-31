=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hitpoints

  BASE_HITPOINTS = 10
  ROLLS = (1..6).to_a.freeze

  def self.modifier(constitution)
    (constitution - BASE_HITPOINTS) / 2
  end

  def initialize
    @strength = roll_four_dices
    @dexterity = roll_four_dices
    @constitution = roll_four_dices
    @intelligence = roll_four_dices
    @wisdom = roll_four_dices
    @charisma = roll_four_dices
    @hitpoints = BASE_HITPOINTS + DndCharacter.modifier(@constitution)
  end

  private

  def roll_four_dices
    results = []

    (1..4).each { |_| results << ROLLS.sample }

    min_index = results.index(results.min)
    results.delete_at(min_index)
    results.sum
  end
end
