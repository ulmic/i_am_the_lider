class CreateEventParticipants < ActiveRecord::Migration
  def change
    create_table :event_participants do |t|
      t.text :full_name
      t.text :school
      t.integer :report_id
      t.text :group
      t.text :phone

      t.timestamps
    end
  end
end
