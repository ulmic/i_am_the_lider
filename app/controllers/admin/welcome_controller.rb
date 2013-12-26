class Admin::WelcomeController < Admin::ApplicationController
  def index
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
    @new_users = UserDecorator.decorate_collection User.with_confirm_state :new
  end
end
