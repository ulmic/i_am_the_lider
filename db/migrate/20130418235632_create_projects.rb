class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :goal
      t.string :tasks
      t.string :target_audience
      t.string :place
      t.string :description
      t.date :date
      t.string :results

      t.timestamps
    end
  end
end
