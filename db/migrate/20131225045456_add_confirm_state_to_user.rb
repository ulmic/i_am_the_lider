class AddConfirmStateToUser < ActiveRecord::Migration
  def change
    add_column :users, :confirm_state, :string
  end
end
