class RatingsController < ApplicationController
  def index
    @stage = Stage.find params[:id]
    if @stage.published?
      @users = UserDecorator.decorate_collection User.where("last_stage_id >= ?", params[:id])
    else
      redirect_to not_found_errors_path
    end
  end
end
