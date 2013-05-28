class BlogPost < ActiveRecord::Base
  attr_accessible :text, :title, :user_id

  validates :text, :presence => true
  validates :title, :presence => true
  validates :user_id, :presence => true

  belongs_to :user

  def get_html_text
    self.text.bbcode_to_html
  end
end
