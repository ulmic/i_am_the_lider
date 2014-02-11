module Juror::UsersHelper
  def user_has_rating?(user, juror)
    not (user_ratings user, juror).empty?
  end

  def user_ratings(user, juror)
    user.ratings & juror.ratings
  end

  def user_rating_from_juror(user, juror)
    ratings = user_ratings(user, juror)
    if ratings
      ratings.first
    end
  end
end
