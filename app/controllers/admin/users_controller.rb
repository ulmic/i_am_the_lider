class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html { @users = UserDecorator.decorate_collection @users }
      format.xls { send_data @users.to_xls(header: false, only: [:first_name, :middle_name, :last_name, :mobile_phone, :email]) }
    end
  end

  def show
    @user = User.find(params[:id]).decorate
  end

  def new
    @user = NewAdminUserType.new
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to admin_user_path(@user), flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      redirect_to admin_user_path(@user), flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.bust
    redirect_to admin_users_path, flash: :success
  end

  def accept
    @user = User.find params[:id]
    @user.accept
    redirect_to admin_user_path @user
  end

  def reserve
    @user = User.find params[:id]
    @user.reserve
    redirect_to new_admin_reserve_reason_path @user
  end

  def update_stage
    @user = User.find params[:id]
    last_stage_previous = @user.last_stage
    @user.last_stage_id = params[:user][:last_stage_id]
    @user.save
    redirect_to admin_stage_path(last_stage_previous), flash: :success
  end
end
