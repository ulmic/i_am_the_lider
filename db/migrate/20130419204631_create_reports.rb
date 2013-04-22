class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :member_type
      t.integer :member_count
      t.string :venue
      t.date :date

      t.timestamps
    end
  end
end
