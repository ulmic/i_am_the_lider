#encoding: utf-8
class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find params[:id]
  end

  def new
    if user_signed_in?
      @blog_post = BlogPost.new
      @blog_post.user_id = current_user.id
    else
      redirect_to "/404"
    end
  end

  def edit
    @blog_post = BlogPost.find params[:id]
    unless check_access_to_edit? @blog_post
      redirect_to :root
    end
  end

  def create
    if user_signed_in?
      @blog_post = BlogPost.new params[:blog_post]
      @blog_post.user_id = current_user.id
      if @blog_post.save
        redirect_to @blog_post, notice: 'Запись в блог добавлена.'
      else
        render action: "new"
      end
    else
      redirect_to "404"
    end
  end

  def update
    @blog_post = BlogPost.find params[:id]
    if check_access_to_edit? @blog_post
      if @blog_post.update_attributes params[:blog_post]
        redirect_to @blog_post, notice: 'Запись в блоге обновлена.'
      else
        render action: "edit"
      end
    else
      redirect_to @blog_post, notice: 'Вы не можете редактировать эту запись!'
    end
  end

  def destroy
    @blog_post = BlogPost.find params[:id]
    if check_access_to_edit? @blog_post
      @blog_post.destroy
      redirect_to blog_posts_url
    else
      redirect_to @blog_post, notice: "Вы не можете удалить эту запись"
    end
  end
end
