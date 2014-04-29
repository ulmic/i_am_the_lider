class Juror::UsersController < Juror::ApplicationController
  def index
    @users = UserDecorator.decorate_collection User.where("last_stage_id >= ?", current_juror.stage.id)
  end
end
