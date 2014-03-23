class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :goal
      t.text :tasks
      t.text :participant_category
      t.text :description
      t.datetime :begin_date
      t.datetime :end_date
      t.text :adress
      t.float :latitude
      t.float :longtitude
      t.integer :user_id

      t.timestamps
    end
  end
end
