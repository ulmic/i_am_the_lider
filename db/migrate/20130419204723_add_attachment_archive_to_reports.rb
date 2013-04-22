class AddAttachmentArchiveToReports < ActiveRecord::Migration
  def self.up
    change_table :reports do |t|
      t.attachment :archive
    end
  end

  def self.down
    drop_attached_file :reports, :archive
  end
end
