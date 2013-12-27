class Work < ActiveRecord::Base
  attr_accessible :file, :user_id

  belongs_to :user

  mount_uploader :file, WorkUploader

  validates :user_id, presence: true
  validates :file, presence: true
end
