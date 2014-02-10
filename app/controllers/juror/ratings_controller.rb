class Juror::RatingsController < ApplicationController
  def show
    @user = User.find(params[:id]).decorate
    @rating = (user.ratings & current_juror.ratings).first
  end

  def new
    @user = User.find(params[:id]).decorate
    @criterions = current_juror.stage.criterions
    @rating = Rating.new
    @rating.evaluations.build
  end

  def create
    @rating = Rating.new params[:rating]
    if @rating.save
      redirect_to juror_users_path, flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def edit
    @rating = Rating.find params[:id]
  end

  def update
    @rating = Rating.find params[:id]
    if @rating.update_attributes params[:rating]
      redirect_to juror_users_path, flash: :success
    else
      render action: :edit, flash: :error
    end
  end
end
