class Move < ActiveRecord::Base
  belongs_to :element
  has_and_belongs_to_many :monsters
  attr_reader :battlemessage

  def attack(enemy_element)
    @battlemessage = "Attacking with #{self.name}"
    if special
      damage = special_move * calculate_elemental(enemy_element)
    else
      accuracy = 101 - strength
      damage = ((strength * calculate_elemental(enemy_element)) * attack_strength(accuracy)) * 4
      @battlemessage += "#{damage}"
      # @battlemessage = "test"
      # binding.pry;''
    end
    return damage
  end

  def attack_strength(accuracy)
    randomizer = rand(100)
    if randomizer < (accuracy/4)
      @battlemessage += " MISSED!!! "
      return 0
    elsif randomizer > 95
      @battlemessage += " CRITICAL!!! "
      return 2
    else
      @battlemessage += " ATTACK!!! "
      return 1
    end
  end

  def special_move
    return strength
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
