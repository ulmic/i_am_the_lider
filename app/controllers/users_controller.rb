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
      redirect_to @user, flash: :success
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
