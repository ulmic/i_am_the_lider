class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :title
      t.string :epigraph
      t.string :hypertext

      t.timestamps
    end
  end
end
