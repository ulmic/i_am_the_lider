class BlogPost < ActiveRecord::Base
  attr_accessible :text, :title, :user_id

  validates_presence_of :text, :title, :user_id
  belongs_to :user

  def preview
    if self.text.length > 50
      self.text[0..47] + "..."
    else
      self.text
    end
  end

  def get_html_text
    self.text.bbcode_to_html
  end
end
