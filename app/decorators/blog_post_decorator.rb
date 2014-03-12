class BlogPostDecorator < Draper::Decorator
  delegate_all

  def get_html_text
    model.text.bbcode_to_html
  end

end
