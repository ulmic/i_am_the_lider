class Admin::NewsController < Admin::ApplicationController
  def index
    @news = News.all.reverse
  end

  def show
    @news = News.find params[:id]
  end

  def new
    @news = News.new
  end

  def edit
    @news = News.find params[:id]
  end

  def create
    @news = News.new params[:news]
    if @news.save
      redirect_to admin_news_index_path, flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @news = News.find params[:id]
    if @news.update_attributes params[:news]
      redirect_to @news, flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @news = News.find params[:id]
    @news.destroy
    redirect_to news_index_url, flash: :success
  end
end
