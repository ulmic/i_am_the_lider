#encoding: utf-8
class UsersController < ApplicationController
  before_filter :check_if_admin, only: [:destroy, :new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to "/office", notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render action: "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  def login
    if user_signed_in?
      @user = current_user
      redirect_to @user
    else
      @user = User.find_by_login(params[:login])
      if @user && authenticate_user?(@user, params[:password])
        user_sign_in(@user)
        redirect_to @user
      else
        flash.now[:error] = "Ошибка авторизации"
      end
    end
  end
  
  def logout
    user_sign_out
    redirect_to :root
  end
end
