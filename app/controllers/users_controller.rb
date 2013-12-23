class UsersController < ApplicationController
  def index
    @users = UserDecorator.decorate_collection User.all
  end

  def show
    if user_signed_in?
      @user = User.find(params[:id]).decorate
    else
      redirect_to new_session_path
    end
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
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: :new
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      redirect_to @user
    else
      render action: :edit
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_url
  end
end
