class ApplicationController < ActionController::Base
  include AuthHelper
  def check_if_admin
    if session[:admin_id].nil?
      render_404
    end
  end

  def check_if_current_user
     if !(@current_user ||= User.find(session[:user_id]))
       render_404
     end
  end

  def render_404
     render file: "app/views/layouts/404.html.haml", status: 404
  end

  protect_from_forgery
end
