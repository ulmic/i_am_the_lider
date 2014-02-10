class CreateRatingEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :criterion_id
      t.integer :value
      t.integer :rating_id

      t.timestamps
    end
  end
end
