class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.string :p1_monsters
      t.string :p2_monsters
      t.integer :winner_id
      t.integer :stadium_id

      t.timestamps null: false
    end
  end
end
