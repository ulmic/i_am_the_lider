class Admin::ReserveReasonsController < Admin::ApplicationController
  def new
    @reserve_reason = ReserveReason.new
  end

  def edit
    @reserve_reason = ReserveReason.find params[:id]
  end

  def create
    @reserve_reason = ReserveReason.new params[:reserve_reason]
    @reserve_reason.user = User.find params[:id]
    if @reserve_reason.save
      redirect_to user_path @reserve_reason.user, flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @reserve_reason = ReserveReason.find params[:id]
    if @reserve_reason.update_attributes params[:reserve_reason]
      redirect_to user_path @reserve_reason.user, flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @reserve_reason = ReserveReason.find params[:id]
    user = @reserve_reason.user
    @reserve_reason.destroy
    redirect_to user_path user, flash: :success
  end
end
