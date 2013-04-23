class WelcomeController < ApplicationController
  def index
    @users_first = User.first(3)
    @users_last = User.last(3)
    @projects = Project.first(4)
		@last_posts = BlogPost.find(:all, :order => "id desc", :limit => 5).reverse
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def stages
  end
end
