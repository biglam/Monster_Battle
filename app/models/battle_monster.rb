class BattleMonster < ActiveRecord::Base
belongs_to :battle
belongs_to :monster
has_many :battle_monster_moves
# has_one :element
# has_one :user

end
