class Monster < ActiveRecord::Base
  has_and_belongs_to_many :moves
  belongs_to :element

  # def take_damage(damage)
  #   binding.pry;''
  #   self.hp -= damage
  #   self.save
  # end
end
