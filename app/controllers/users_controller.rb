#encoding: utf-8
class UsersController < ApplicationController
  before_filter :check_if_admin, only: [:edit, :update, :destroy, :new, :create]

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

    respond_to do |format|
      if @user.save
        format.html { redirect_to "/office", notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def login
    @user = User.find_by_login(params[:login])
    if @user.password === params[:password]
      user_sign_in(@user)
    else
      flash[:notice] = 'Вы авторизованы'
    end
    redirect_to '/office' 
  end
  
  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  def user_blog
    @blog = user.blog
  end

  def district
    @district = District.find(params[:id])
    place = @district.id
    @users = User.where(:district_id => place)
  end
end
