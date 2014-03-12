class BlogPost < ActiveRecord::Base
  attr_accessible 	:text,
			        :title,
			        :user_id

  belongs_to :user

  validates :text, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end
