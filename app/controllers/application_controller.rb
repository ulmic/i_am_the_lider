class ApplicationController < ActionController::Base
  include AuthHelper
  def check_if_admin
    if !admin_signed_in?
      render_404
    end
  end

  def check_current_user
    if !user_signed_in?
      render_404
    end
  end
  
  def render_404
     render file: "app/views/layouts/404.html.haml", status: 404
  end

  protect_from_forgery
end
