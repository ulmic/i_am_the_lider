class ApplicationController < ActionController::Base
  include AuthHelper
  include RegistrationHelper

  def check_user_signed
    unless user_signed_in?
      redirect_to not_found_errors_path
    end
  end

  def current_user_on_page?(user)
    if current_user
      current_user.id === user.id
    end
  end

  protect_from_forgery

  before_filter :basic_auth if Rails.env.staging?
end
