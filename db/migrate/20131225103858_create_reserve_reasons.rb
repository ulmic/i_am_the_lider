class CreateReserveReasons < ActiveRecord::Migration
  def change
    create_table :reserve_reasons do |t|
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
