class WelcomeController < ApplicationController
  def index
    @users_first = User.first(3)
    @users_last = User.last(3)
    @projects = Project.first(4)
    @news = News.last(2).reverse
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to ''
  end
  
  def competition
  end

  def stages
  end
  
  def competition
  end
end
