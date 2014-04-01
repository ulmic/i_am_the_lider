class CreateEventPhotos < ActiveRecord::Migration
  def change
    create_table :event_photos do |t|
      t.text :file
      t.integer :report_id

      t.timestamps
    end
  end
end
