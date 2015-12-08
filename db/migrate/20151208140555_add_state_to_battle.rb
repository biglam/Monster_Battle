class AddStateToBattle < ActiveRecord::Migration
  def change
    add_column :battles, :state, :string
  end
end
