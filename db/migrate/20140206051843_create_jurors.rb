class CreateJurors < ActiveRecord::Migration
  def change
    create_table :jurors do |t|
      t.text :first_name
      t.string :last_name
      t.string :login
      t.string :password
      t.integer :stage_id

      t.timestamps
    end
  end
end
