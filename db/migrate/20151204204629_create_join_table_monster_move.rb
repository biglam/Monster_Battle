class CreateJoinTableMonsterMove < ActiveRecord::Migration
  def change
    create_join_table :monsters, :moves do |t|
      # t.index [:monster_id, :move_id]
      # t.index [:move_id, :monster_id]
    end
  end
end
