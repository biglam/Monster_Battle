class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :name, :default => 'Element_X'
      t.string :strong_to, :default => ''
      t.string :weak_to, :default => ''
      t.string :neutral, :default => ''
      t.string :immune, :default => ''

      t.timestamps null: false
    end
  end
end
