class AddLastStageToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_stage_id, :integer
  end
end
