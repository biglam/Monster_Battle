class Move < ActiveRecord::Base
  belongs_to :element
  has_and_belongs_to_many :monsters

  def attack(enemy_element)
    if special
      damage = special_move * calculate_elemental(enemy_element)
    else
      accuracy = 101 - strength
      damage = (strength * calculate_elemental(enemy_element)) * attack_strength(accuracy)
    end
    return damage
  end

  def attack_strength(accuracy)
    randomizer = rand(100)
    if randomizer < accuracy/2
      puts "miss"
      return 0
    elsif randomizer > 95
      puts "CRITICAL!!"
      return 2
    else
      return 1
    end
  end

  def special_move
    return 150
  end

  def calculate_elemental(enemy_element)
    opponent = Element.where(name: enemy_element)[0]
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
