class Admin::StagesController < ApplicationController
  def index
    @stages = Stage.all
  end

  def new
    @stage = Stage.new
  end

  def edit
    @stage = Stage.find params[:id]
  end

  def create
    @stage = Stage.new params[:stage]
    if @stage.save
      redirect_to admin_stages_path, flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @stage = Stage.find params[:id]
    if @stage.update_attributes params[:stage]
      redirect_to admin_stages_path, flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @stage = Stage.find params[:id]
    @stage.destroy
    redirect_to admin_stages_path, flash: :success
  end

  def publish
    @stage = Stage.find params[:id]
    @stage.publish
    redirect_to admin_ratings_path @stage
  end

  def unpublish
    @stage = Stage.find params[:id]
    @stage.unpublish
    redirect_to admin_ratings_path @stage
  end
end
