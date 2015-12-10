class AddMessageToBattle < ActiveRecord::Migration
  def change
    add_column :battles, :battlemsg, :string
  end
end
