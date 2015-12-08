class AddTurnToBattle < ActiveRecord::Migration
  def change
    add_column :battles, :turn, :string
  end
end
