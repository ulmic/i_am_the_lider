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
      flash_now! :success
      redirect_to news_path @news
    else
      flash_now! :error
      render action: :new
    end
  end

  def update
    @news = News.find params[:id]
    if @news.update_attributes params[:news]
      flash_now! :success
      redirect_to @news
    else
      flash_now! :error
      render action: :edit
    end
  end

  def destroy
    @news = News.find params[:id]
    @news.destroy
    flash_now! :success
    redirect_to news_index_url
  end
end
