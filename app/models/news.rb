class News < ActiveRecord::Base
  attr_accessible 	:body,
			        :pusblished_at,
			        :title,
                    :photo

  mount_uploader :photo, PhotoUploader

  validates :body, presence: true
  validates :pusblished_at, presence: true
  validates :title,	presence: true,
                    length: { maximum: 140 }
  validates :photo, presence: true
end
