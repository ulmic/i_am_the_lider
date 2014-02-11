class AddDatesToStages < ActiveRecord::Migration
  def change
    add_column :stages, :begin_date, :date
    add_column :stages, :end_date, :date
  end
end
