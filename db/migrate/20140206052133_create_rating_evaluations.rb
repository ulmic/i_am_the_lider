class CreateRatingEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :criterion_id
      t.integer :user_id
      t.integer :juror_id
      t.integer :value

      t.timestamps
    end
  end
end
