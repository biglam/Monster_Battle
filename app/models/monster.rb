class Monster < ActiveRecord::Base
  has_and_belongs_to_many :moves
  belongs_to :element
  belongs_to :battle_monster

  # def take_damage(damage)
  #   binding.pry;''
  #   self.hp -= damage
  #   self.save
  # end
end
