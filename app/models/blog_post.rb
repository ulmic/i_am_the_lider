#encoding: utf-8
class BlogPost < ActiveRecord::Base
  attr_accessible 	:text, 
			:title, 
			:user_id

  belongs_to :user

  validates :text, 	presence: true
  validates :title, 	presence: true
  validates :user_id, 	presence: true

  def get_html_text
    self.text.bbcode_to_html
  end
end
