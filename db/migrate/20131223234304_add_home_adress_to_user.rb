class AddHomeAdressToUser < ActiveRecord::Migration
  def change
    add_column :users, :adress_index, :integer
    add_column :users, :locality, :text
  end
end
