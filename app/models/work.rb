class Work < ActiveRecord::Base
  attr_accessible :file, :user_id, :link

  belongs_to :user

  mount_uploader :file, WorkUploader

  validates :user_id, presence: true
  validates :file, presence: true, file_size: { maximum: 25.megabytes.to_i }
  validates :link, url: true
end
