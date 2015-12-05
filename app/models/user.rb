class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :battles_as_p1, class_name: 'Battle', foreign_key: :player1_id
  has_many :battles_as_p2, class_name: 'Battle', foreign_key: :player2_id

end
