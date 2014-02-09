class Juror::UsersController < Juror::ApplicationController
  def index
    @users = User.with_confirm_state :accepted
  end
end
