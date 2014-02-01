class AddWorkFileLink < ActiveRecord::Migration
  def up
    add_column :works, :link, :text
  end
end
