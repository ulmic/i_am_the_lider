#encoding: utf-8
class BlogPostsController < ApplicationController
  before_filter :check_if_admin, only: [:edit, :update, :destroy]
  #before_filter :check_if_current_user, only: [:edit, :update, :destroy, :create, :new]

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def new
    @blog_post = BlogPost.new
    @blog_post.user_id=session[:user_id] #if User.find(session[:user_id]).present?
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
    unless @blog_post.user_id == session[:user_id]
      redirect_to :root
    end
  end

  def create
    @blog_post = BlogPost.new(params[:blog_post])
    @blog_post.user_id=session[:user_id]
    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to :office, notice: 'Запись в блог добавлена.' }
        format.json { render json: @blog_post, status: :created, location: @blog_post }
      else
        format.html { render action: "new" }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @blog_post = BlogPost.find(params[:id])

    respond_to do |format|
      if @blog_post.update_attributes(params[:blog_post])
        format.html { redirect_to @blog_post, notice: 'Запись в блоге обновлена.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy

    respond_to do |format|
      format.html { redirect_to blog_posts_url }
      format.json { head :no_content }
    end
  end
end
