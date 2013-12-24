class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :title
      t.text :body
      t.date :pusblished_at

      t.timestamps
    end
  end
end
