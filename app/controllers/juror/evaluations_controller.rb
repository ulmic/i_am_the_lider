class Juror::EvaluationsController < ApplicationController
  def index
    @criterions = current_juror.stage.criterions
    @user = User.find(params[:id]).decorate
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new params[:evaluation]
    if @evaluation.save
      redirect_to juror_evaluations_path(@evaluation.participant), flash: :success
    else
      redirect_to juror_evaluations_path(@evaluation.participant), flash: :error
    end
  end

  def update
    @evaluation = Evaluation.find params[:id]
    if @evaluation.update_attributes params[:evaluation]
      redirect_to juror_evaluations_path(@evaluation.participant), flash: :success
    else
      redirect_to juror_evaluations_path(@evaluation.participant), flash: :error
    end
  end
end
