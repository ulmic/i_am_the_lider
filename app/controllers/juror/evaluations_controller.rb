class Juror::EvaluationsController < ApplicationController
  def index
    @criterions = current_juror.stage.criterions
    @user = User.find params[:id]
    @evaluation = Rating::Evaluation.new
  end

  def create
    @evaluation = Rating::Evaluation.new params[:evaluation]
    if @evaluation.save
      redirect_to juror_evaluations_path(@evaluation.user), flash: :success
    else
      redirect_to juror_evaluations_path(@evaluation.user), flash: :error
    end
  end

  def update
    @evaluation = Rating::Evaluation.find params[:id]
    if @evaluation.update_attributes params[:evaluation]
      redirect_to juror_evaluations_path(@evaluation.user), flash: :success
    else
      redirect_to juror_evaluations_path(@evaluation.user), flash: :error
    end
  end
end
