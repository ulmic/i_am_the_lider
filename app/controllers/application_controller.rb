class ApplicationController < ActionController::Base
  def check_if_admin
    if session[:admin_id].nil?
      render_404
    end
  end

  def check_if_current_user
    if session[:user_id].nil?
      render_404
    end
  end

  def render_404
     render file: "app/views/layouts/404.html.haml", status: 404
  end

  include AuthHelper
  protect_from_forgery
end
