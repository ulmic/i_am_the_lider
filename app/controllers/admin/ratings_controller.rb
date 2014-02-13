class Admin::RatingsController < Admin::ApplicationController
  def index
    @users = UserDecorator.decorate_collection User.with_confirm_state :accepted
    @stage = Stage.find params[:id]
  end
end
