class WelcomeController < ApplicationController
  def index
<<<<<<< HEAD
<<<<<<< HEAD
    @users = User.all

=======
    @users_first = User.first(3)
    @users_last = User.last(3)
    @projects = Project.first(4)
>>>>>>> make_up
=======
    @users_first = User.first(3)
    @users_last = User.last(3)
    @projects = Project.first(4)
>>>>>>> make_up
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page }
    end
  end
end
