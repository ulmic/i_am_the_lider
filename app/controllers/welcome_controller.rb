class WelcomeController < ApplicationController
  def index
    @users_first = User.first(3)
    @users_last = User.last(3)
    @projects = Project.first(4)
    @news = News.last(2).reverse
  end
  
  def first_stage
  end
  
  def second_stage
  end
  
  def third_stage
  end
  
  def competition
  end
end
