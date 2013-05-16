class NewsController < ApplicationController
  before_filter :check_if_admin, only: [:edit, :update, :destroy, :create, :new]

  def index
    @news = News.all.reverse
  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
  end

  def edit
    @news = News.find(params[:id])
  end

  def create
    @news = News.new(params[:news])

    if @news.save
      redirect_to @news
    else
      render action: "new"
    end
  end

  def update
    @news = News.find(params[:id])

    if @news.update_attributes(params[:news])
      redirect_to @news
    else
      render action: "edit"
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to news_index_url
  end
end
