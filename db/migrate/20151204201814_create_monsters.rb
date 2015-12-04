class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name, :default => 'Pichu'
      t.integer :element_id
      t.integer :move_id
      t.string :image_front
      t.string :image_back
      t.string :strike_sound
      t.string :hurt_sound
      t.integer :hp, :default => 1000

      t.timestamps null: false
    end
  end
end
