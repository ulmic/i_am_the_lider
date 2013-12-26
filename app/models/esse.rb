class Esse < ActiveRecord::Base
  attr_accessible :file, :user_id

  belongs_to :user

  mount_uploader :file, EsseUploader

  validates :user_id, presence: true
  validates :file, presence: true
end
