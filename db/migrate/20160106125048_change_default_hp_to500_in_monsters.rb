class ChangeDefaultHpTo500InMonsters < ActiveRecord::Migration
  def change
      change_column :monsters, :hp, :integer, :default => 500
  end
end
