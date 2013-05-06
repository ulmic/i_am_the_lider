class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :body
      t.date :pusblished_at

      t.timestamps
    end
  end
end
