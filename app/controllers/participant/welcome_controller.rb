class Participant::WelcomeController < Participant::ApplicationController
  def index
    @blogs = User.find(params[:id]).blog_posts.reverse.last 3
  end
end
