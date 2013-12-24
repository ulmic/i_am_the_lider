class RemoveConfirmFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :confirm
  end
end
