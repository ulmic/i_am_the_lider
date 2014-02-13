class AddAverageToStage < ActiveRecord::Migration
  def change
    add_column :stages, :average, :integer
  end
end
