class BattleMonsterMove < ActiveRecord::Base
  belongs_to :battle_monster
  belongs_to :move
  
end
