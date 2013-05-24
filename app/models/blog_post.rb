class BlogPost < ActiveRecord::Base
  attr_accessible :text, :title, :user_id

  validates_presence_of :text, :title, :user_id
  belongs_to :user

  def get_html_text
    self.text.bbcode_to_html
  end
end
