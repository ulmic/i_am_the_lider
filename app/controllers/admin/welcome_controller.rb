class Admin::WelcomeController < Admin::ApplicationController
  def index
    @new_users = UserDecorator.decorate_collection User.with_confirm_state :new
    @reserved_users = UserDecorator.decorate_collection User.with_confirm_state :reserved
  end
end
