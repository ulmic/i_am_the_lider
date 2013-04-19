class AddAvatarToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :portfolio
    end
  end

  def self.down
    drop_attached_file :users, :portfolio
  end
end
