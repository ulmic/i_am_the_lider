class BlogPost < ActiveRecord::Base
  attr_accessible :text, :title

  belongs_to :user

  def get_html_text
    self.text.bbcode_to_html
  end
end
