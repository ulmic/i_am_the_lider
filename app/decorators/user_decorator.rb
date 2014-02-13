class UserDecorator < Draper::Decorator
  delegate_all

  def title
    "#{model.first_name} #{model.middle_name} #{model.last_name}"
  end

  def small_name
    "#{model.first_name} #{model.middle_name}"
  end

  def twitter_account
    "@#{model.twitter.split('/').last}"
  end

  def average_eval
    sum = 0
    model.ratings.each do |r|
      sum += r.decorate.sum
    end
    average = sum / model.ratings.count
  end
end
