class AddToReportUserId < ActiveRecord::Migration
  def up
    add_column :reports, :user_id, :integer
  end

  def down
  end
end
