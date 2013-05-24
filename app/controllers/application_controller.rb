class ApplicationController < ActionController::Base
  include AuthHelper

  def check_if_admin
    unless admin_signed_in?
      redirect_to "/404"
    end
  end

  protect_from_forgery
end
