class WelcomeController < ApplicationController
  def index
    @users = User.all.shuffle!.first 10
    @reports = Report.all.shuffle!.first 4
    @news = News.last(10).reverse
    @blog_posts = BlogPost.last(5).reverse
  end

  def first_stage
  end

  def second_stage
  end

  def third_stage
  end

  def competition
  end
end
