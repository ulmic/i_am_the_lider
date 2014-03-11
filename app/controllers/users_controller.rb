class UsersController < ApplicationController
  def index
    @users = UserDecorator.decorate_collection User.with last_stage_id: current_stage.id
  end

  def show
    @user = User.find(params[:id]).decorate
    unless @user.accepted? or current_user_on_page? @user or admin_signed_in?
      redirect_to not_found_errors_path
    end
  end

  def new
    if can_registred?
      @user = User.new
    else
      redirect_to reg_end_welcome_path
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    #FIXME реализовать иное назначение last_stage_id
    params[:user][:last_stage_id] = 1

    @user = User.new params[:user]
    if @user.save
      user_sign_in @user
      redirect_to new_works_path(@user), flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      redirect_to @user, flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_url, flash: :success
  end
end
