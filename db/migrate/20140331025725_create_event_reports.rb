class CreateEventReports < ActiveRecord::Migration
  def change
    create_table :event_reports do |t|
      t.text :description
      t.text :document
      t.integer :event_id

      t.timestamps
    end
  end
end
