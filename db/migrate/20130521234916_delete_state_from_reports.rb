class DeleteStateFromReports < ActiveRecord::Migration
  def up
    remove_column :reports, :state
  end

  def down
  end
end
