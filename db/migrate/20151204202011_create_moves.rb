class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name, :default => 'Attack'
      t.integer :strength, :default => '50'
      t.integer :element_id
      t.boolean :special, :default => false
      t.integer :remaining_uses, :default => 10

      t.timestamps null: false
    end
  end
end
