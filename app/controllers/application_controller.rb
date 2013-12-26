class ApplicationController < ActionController::Base
  include AuthHelper

  def check_user_signed
    unless user_signed_in?
      redirect_to not_found_errors_path
    end
  end

  def current_user_on_page?(user)
    current_user.id === user.id
  end

  protect_from_forgery

  before_filter :basic_auth if Rails.env.staging?
end
