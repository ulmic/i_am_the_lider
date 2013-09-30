class ApplicationController < ActionController::Base
  include AuthHelper

  def check_if_admin
    unless admin_signed_in?
      redirect_to not_found_errors_path
    end
  end

  def check_user_signed
    unless user_signed_in?
      redirect_to not_found_errors_path
    end
  end

  protect_from_forgery
end
