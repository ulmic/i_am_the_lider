class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.text :title
      t.text :text
      t.integer :user_id

      t.timestamps
    end
  end
end
