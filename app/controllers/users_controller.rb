class UsersController < ApplicationController
  def index
    @users = UserDecorator.decorate_collection User.all
  end

  def show
    @user = User.find(params[:id]).decorate
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.new params[:user]
    if @user.save
      flash_now! :success
      redirect_to @user, notice: 'User was successfully created.'
    else
      flash_now! :error
      render action: :new
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      flash_now! :success
      redirect_to @user
    else
      flash_now! :error
      render action: :edit
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash_now! :success
    redirect_to users_url
  end
end
