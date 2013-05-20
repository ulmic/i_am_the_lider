class AddUserConfirm < ActiveRecord::Migration
  def up
    add_column :users, :confirm, :boolean
  end

  def down
  end
end
