class Admin::CriterionsController < ApplicationController
  def index
    @criterions = Rating::Criterion.where(stage_id: params[:id])
  end

  def new
    @criterion = Rating::Criterion.new
  end

  def edit
    @criterion = Rating::Criterion.find params[:id]
  end

  def create
    @criterion = Rating::Criterion.new params[:criterion]
    @criterion.stage_id = params[:id]
    if @criterion.save
      redirect_to admin_criterions_path, flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @criterion = Rating::Criterion.find params[:id]
    if @criterion.update_attributes params[:criterion]
      redirect_to admin_criterions_path, flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @criterion = Rating::Criterion.find params[:id]
    @criterion.destroy
    redirect_to admin_criterions_path, flash: :success
  end
end
