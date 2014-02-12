class Admin::RatingsController < Admin::ApplicationController
  def index
    @users = UserDecorator.decorate_collection User.with_confirm_state :accepted
  end
end
