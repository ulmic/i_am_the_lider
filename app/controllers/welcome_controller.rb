class WelcomeController < ApplicationController
  def index
<<<<<<< HEAD
    @users_first = User.first(3)
    @users_last = User.last(3)
    @projects = Project.first(4)
=======
    @users = User.all

>>>>>>> local
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page }
    end
  end
end
