class WelcomeController < ApplicationController
  def index
    accepted_users = User.with_confirm_state :accepted
    @users = accepted_users.shuffle!.first 12
    @reports = Report.all.shuffle!.first 4
    @news = News.last(2).reverse
    @blog_posts = BlogPost.last(5).reverse
    @users_count = accepted_users.count
  end

  def first_stage
  end

  def second_stage
  end

  def third_stage
  end

  def competition
  end

  def reg_end
    if can_registred?
      redirect_to new_user_path
    end
  end
end
