class AddPublishToStage < ActiveRecord::Migration
  def change
    add_column :stages, :ratings_publish_state, :string
  end
end
