class Juror::EvaluationsController < Juror::ApplicationController
  def index
    @criterions = current_juror.stage.criterions
    @user = User.find(params[:id]).decorate
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new params[:evaluation]
    if @evaluation.save
      redirect_to juror_evaluations_path @evaluation.user, flash: :success
    else
      redirect_to juror_evaluations_path params[:id], flash: :error
    end
  end

  def destroy
    @evaluation = Evaluation.find params[:id]
    user = @evaluation.user
    @evaluation.destroy
    redirect_to juror_evaluations_path user
  end
end
