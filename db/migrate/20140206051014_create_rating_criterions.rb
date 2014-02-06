class CreateRatingCriterions < ActiveRecord::Migration
  def change
    create_table :rating_criterions do |t|
      t.text :title
      t.integer :stage_id
      t.integer :maximum

      t.timestamps
    end
  end
end
