class UsersController < ApplicationController
  before_filter :check_if_admin, only: [:edit, :update, :destroy, :new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if params[:id] == session[:user_id].to_s
      redirect_to :office
    else
      @user = User.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
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

  # PUT /users/1
  # PUT /users/1.json
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

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def login
    if session[:user_id].nil?
      if request.post?
        @user = User.find_by_login(params[:login])
        if @user.nil?
          flash[:notice] = 'Неверный логин или пароль'
        else
          if @user.password === params[:password]
            session[:user_id] = @user.id
            flash[:notice] = 'Вы успешно зарегистрированы.'
          else
            flash[:notice] = 'Неверный логин или пароль'
          end
        end
      end
    else
      @user = User.find(session[:user_id])
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  def user_blog
    @blog = user.blog
  end

  def current_user?
    session[:user_id] === id
  end
end
