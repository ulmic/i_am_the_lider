class BlogPostsController < ApplicationController
  before_filter :check_user_signed, only: [ :new, :create ]

  def index
    @blog_posts = BlogPost.all.reverse
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
    unless check_access_to_edit? @blog_post
      redirect_to not_found_errors_path
    end
  end

  def create
    @blog_post = BlogPost.new params[:blog_post]
    if user_signed_in?
      @blog_post.user_id = params[:id]
      if @blog_post.save
        redirect_to @blog_post.user, flash: :success
      else
        render action: :new, flash: :error
      end
    else
      redirect_to User.find params[:id]
    end
  end

  def update
    @blog_post = BlogPost.find params[:id]
    if check_access_to_edit? @blog_post
      if @blog_post.update_attributes params[:blog_post]
        redirect_to @blog_post, flash: :success
      else
        render action: :edit, flash: :error
      end
    else
      redirect_to @blog_post, notice: t('without_access_to_edit')
    end
  end

  def destroy
    @blog_post = BlogPost.find params[:id]
    if check_access_to_edit? @blog_post
      @blog_post.destroy
      redirect_to blog_posts_url, flash: :success
    else
      redirect_to @blog_post.user, notice: t('without_access_to_destroy')
    end
  end
end
