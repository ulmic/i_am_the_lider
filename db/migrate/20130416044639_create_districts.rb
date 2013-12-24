class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.text :title

      t.timestamps
    end
  end
end
