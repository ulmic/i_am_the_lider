class Admin::RatingsController < Admin::ApplicationController
  def index
    @users = UserDecorator.decorate_collection User.where("last_stage_id >= ?", params[:id])
    @stage = Stage.find params[:id]
  end
end
