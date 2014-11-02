class AddResultsToReports < ActiveRecord::Migration
  def change
    add_column :event_reports, :results, :text
  end
end
