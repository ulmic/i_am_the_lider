class Event::Photo < ActiveRecord::Base
  attr_accessible :file, :report_id

  belongs_to :report

  mount_uploader :file, PhotoUploader

  validates :file, presence: true
  validates :report_id, presence: true
end
