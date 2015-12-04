class Move < ActiveRecord::Base
  belongs_to :element
  has_and_belongs_to_many :monsters

  def attack(enemy_element)
    if special
      damage = special_move * calculate_elemental(enemy_element)
    else
      acc = 101 - strength
      puts "acc = #{acc}"
      damage = (strength * calculate_elemental(enemy_element)) if rand(100) > acc
    end
    return damage
  end

  def special_move
    return 150
  end

  def calculate_elemental(enemy_element)
    opponent = Element.where(name: enemy_element)[0]
    puts opponent.name
    multiplier = 1
    if opponent.weak_to.include? element.name
      multiplier = 2
    elsif opponent.neutral.include? element.name
      multiplier = 1
    elsif opponent.strong_to.include? element.name
      multiplier = 0.5
    elsif opponent.immune.include? element.name
      multiplier = 0
    end
    return multiplier
  end
end
