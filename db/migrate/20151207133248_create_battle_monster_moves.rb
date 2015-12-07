class CreateBattleMonsterMoves < ActiveRecord::Migration
  def change
    create_table :battle_monster_moves do |t|
      t.integer :battle_monster_id
      t.integer :move_id

      t.timestamps null: false
    end
  end
end
