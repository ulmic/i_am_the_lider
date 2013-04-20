class WelcomeController < ApplicationController
  def index
    @users = User.all
    @projects = Project.last(4)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page }
    end
  end
end
