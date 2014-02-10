module Juror::RatingsHelper
  def user_has_rating?(user, juror)
    user.ratings & juror.ratings
  end
end
