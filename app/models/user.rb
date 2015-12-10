class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :battles_as_p1, class_name: 'Battle', foreign_key: :player1_id
  has_many :battles_as_p2, class_name: 'Battle', foreign_key: :player2_id

  def self.avatars
    ['/images/trainers/boys/Brendan.png',
      '/images/trainers/boys/Calem.png',
      '/images/trainers/boys/Craig.png',
      '/images/trainers/boys/dark1.jpg',
      '/images/trainers/boys/Lucas.png',
      '/images/trainers/boys/Nate.png',
      '/images/trainers/boys/Roza.png',
      '/images/trainers/boys/Scott.png',
      '/images/trainers/girls/Ace.png',
      '/images/trainers/girls/Dawn.png',
      '/images/trainers/girls/Dee.png',
      '/images/trainers/girls/Jess.png',
      '/images/trainers/girls/Jester.png',
      '/images/trainers/girls/Pink.png',
      '/images/trainers/girls/Psy.png',
      '/images/trainers/girls/Sunshine.png']
    end

  end
