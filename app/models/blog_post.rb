class BlogPost < ActiveRecord::Base
  attr_accessible :text, :title

  belongs_to :user

  def preview
    if self.text.length>140
      self.text[0..137]+"..." 
    else
      self.text
    end
  end

  def get_html_text
    self.text.bbcode_to_html
  end
end
