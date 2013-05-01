class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end
