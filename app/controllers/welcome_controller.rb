class WelcomeController < ApplicationController
  def index
    current_users = User.with last_stage_id: current_stage.id
    @users = current_users.shuffle!.first 12
    @news = News.last(3).reverse
    @blogs = BlogPost.last(4).reverse
    @users_count = current_users.count
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
