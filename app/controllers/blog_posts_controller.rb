class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPostDecorator.decorate_collection BlogPost.all.reverse
  end

  def show
    @blog_post = BlogPost.find params[:id]
  end
end
