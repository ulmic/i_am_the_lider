class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :member_type
      t.integer :member_count
      t.text :venue
      t.date :date

      t.timestamps
    end
  end
end
