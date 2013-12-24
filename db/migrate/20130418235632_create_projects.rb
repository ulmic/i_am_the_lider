class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :goal
      t.text :tasks
      t.text :target_audience
      t.text :place
      t.text :description
      t.date :date
      t.text :results

      t.timestamps
    end
  end
end
