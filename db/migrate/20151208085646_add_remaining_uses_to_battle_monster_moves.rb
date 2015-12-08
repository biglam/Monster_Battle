class AddRemainingUsesToBattleMonsterMoves < ActiveRecord::Migration
  def change
    add_column :battle_monster_moves, :remaining_uses, :integer
  end
end
