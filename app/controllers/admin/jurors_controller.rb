class Admin::JurorsController < Admin::ApplicationController
  def index
    @jurors = Juror.with stage_id: params[:id]
  end

  def new
    @juror = Juror.new
  end

  def edit
    @juror = Juror.find params[:id]
  end

  def create
    @juror = Juror.new params[:juror]
    if @juror.save
      redirect_to admin_jurors_path, flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @juror = Juror.find params[:id]
    if @juror.update_attributes params[:juror]
      redirect_to admin_jurors_path, flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @juror = Juror.find params[:id]
    @juror.destroy
    redirect_to admin_jurors_path, flash: :success
  end
end
