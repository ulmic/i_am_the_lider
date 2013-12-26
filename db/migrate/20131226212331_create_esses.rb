class CreateEsses < ActiveRecord::Migration
  def change
    create_table :esses do |t|
      t.integer :user_id
      t.text :file

      t.timestamps
    end
  end
end
