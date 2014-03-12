class Participant::WelcomeController < Participant::ApplicationController
  def index
    @blogs = User.find(params[:id]).blog_posts
  end
end
