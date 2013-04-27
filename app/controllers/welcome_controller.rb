class WelcomeController < ApplicationController
  def index
    @users_first = User.first(3)
    @users_last = User.last(3)
    @projects = Project.first(4)

    if session[:user_id].nil?
      if request.post?
        @user = User.find_by_login(params[:login])
        if @user.nil?
          flash[:notice] = 'Неверный логин или пароль'
        else
          if @user.password === params[:password]
            session[:user_id] = @user.id
          else
            flash[:notice] = 'Неверный логин или пароль'
          end
        end
      end
    else
      @user = User.find(session[:user_id])
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to ''
  end
  
  def stages
  end
  
  def competition
  end
end
