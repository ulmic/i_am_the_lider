class Participant::BlogPostsController < Participant::ApplicationController
  def index
    @blog_posts = BlogPostDecorator.decorate_collection User.find(params[:id]).blog_posts.reverse
  end

  def show
    @blog_post = BlogPost.find params[:id]
  end

  def new
    @blog_post = BlogPost.new
    @blog_post.user_id = current_user.id
  end

  def edit
    @blog_post = BlogPost.find params[:id]
  end

  def create
    @blog_post = BlogPost.new params[:blog_post]
    if @blog_post.save
      redirect_to participant_blog_posts_path(@blog_post.user), flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @blog_post = BlogPost.find params[:id]
    if @blog_post.update_attributes params[:blog_post]
      redirect_to @blog_post, flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @blog_post = BlogPost.find params[:id]
    user = @blog_post.user
    @blog_post.destroy
    redirect_to participant_blog_posts_path(user), flash: :success
  end
end
