class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :goal
      t.text :tasks
      t.text :participant_category
      t.text :description
      t.date :begin_date
      t.date :end_date
      t.text :adress

      t.timestamps
    end
  end
end
