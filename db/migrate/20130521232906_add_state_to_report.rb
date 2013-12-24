class AddStateToReport < ActiveRecord::Migration
  def change
    add_column :reports, :state, :text
  end
end
