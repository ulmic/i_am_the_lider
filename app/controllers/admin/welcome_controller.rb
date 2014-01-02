class Admin::WelcomeController < Admin::ApplicationController
  def index
    @new_users = UserDecorator.decorate_collection User.with_confirm_state :new
  end
end
