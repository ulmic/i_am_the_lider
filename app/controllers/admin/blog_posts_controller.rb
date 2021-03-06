class Admin::BlogPostsController < Admin::ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def edit
    @blog_post = BlogPost.find params[:id]
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
    @blog_post.destroy
    redirect_to admin_blog_posts_url, flash: :success
  end
end
