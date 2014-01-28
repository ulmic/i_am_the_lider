module ApplicationHelper
  include AuthHelper
  include AutoHtml

  def copyright_notice_year_range(start_year)
    start_year = start_year.to_i
    current_year = Time.new.year
    if current_year > start_year && start_year > 2000
      "#{start_year} - #{current_year}"
    elsif start_year > 2000
      "#{start_year}"
    else
      "#{current_year}"
    end
  end

  def current_user_on_page?(user)
    if current_user
      current_user.id === user.id
    end
  end

  def youtube_video(link)
    if link
      auto_html link do
        youtube width: 384, height: 240
      end
    end
  end
end
