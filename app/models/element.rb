class Element < ActiveRecord::Base
  has_many :monsters
  has_many :moves

  
end
