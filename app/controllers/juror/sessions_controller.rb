class Juror::SessionsController < ApplicationController
  def new
    @juror = Juror.new
  end

  def create
    @juror = Juror.find_by_login params[:juror][:login]
    if @juror && authenticate_juror?(@juror, params[:juror][:password])
      juror_sign_in @juror
      redirect_to juror_welcome_index_path, flash: :success
    else
      @juror = Juror.new params[:juror]
      flash[:notice] = t('wrong_login')
      render action: :new
    end
  end

  def destroy
    juror_sign_out
    redirect_to :root, flash: :success
  end
end
