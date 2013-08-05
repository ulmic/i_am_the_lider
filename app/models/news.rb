#encoding: utf-8
class News < ActiveRecord::Base
  attr_accessible 	:body, 
			:pusblished_at, 
			:title

  validates :body, 		presence: true
  validates :pusblished_at, 	presence: true
  validates :title, 		presence: true,
                    		length: { maximum: 140 }
end
