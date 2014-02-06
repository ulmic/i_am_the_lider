class CreateJurors < ActiveRecord::Migration
  def change
    create_table :jurors do |t|
      t.text :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
