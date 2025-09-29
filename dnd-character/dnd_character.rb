=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hitpoints

  def self.modifier(score)
    ((score - 10) / 2.0).floor
  end

  def initialize
    @strength = roll_ability
    @dexterity = roll_ability
    @constitution = roll_ability
    @intelligence = roll_ability
    @wisdom = roll_ability
    @charisma = roll_ability
    @hitpoints = 10 + DndCharacter.modifier(@constitution)
  end

  private

  def roll_ability
    rolls = 4.times.map { rand(1..6) }
    rolls.sort.drop(1).sum
  end
end
