class Monster < ActiveRecord::Base
  has_many :moves

  def take_damage(damage)
    binding.pry;''
    self.hp -= damage
    self.save
  end
end
