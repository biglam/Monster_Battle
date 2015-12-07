class CreateBattleMonsters < ActiveRecord::Migration
  def change
    create_table :battle_monsters do |t|
      t.integer :monster_id
      t.integer :battle_id
      t.string :player
      t.integer :hp
      t.integer :position
      t.integer :element_id

      t.timestamps null: false
    end
  end
end
