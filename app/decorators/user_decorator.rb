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

  def average_eval(stage)
    sum = 0
    if has_ratings_on_stage?(stage)
      ratings_on_stage(stage).each do |r|
        sum += r.decorate.sum
      end
      average = sum / ratings_on_stage(stage).count
    else
      -1
    end
  end

  def has_entered?(stage)
    if stage.average
      if average_eval(stage) >= stage.average
        h.content_tag :h3, color: :green do
          I18n.t('admin.ratings.index.has_entered_to_next_stage')
        end
      elsif average_eval(stage) == -1
        h.content_tag :h3 do
          I18n.t('admin.ratings.index.juror_has_not_evaluate_yet')
        end
      else
        h.content_tag :h3, color: :red do
          I18n.t('admin.ratings.index.has_not_entered_to_next_stage')
        end
      end
    end
  end

  def ratings_on_stage(stage)
    ratings_on = Array.new
    stage.jurors.each do |juror|
      if model.ratings.any? and juror.ratings.any?
        ratings_on += model.ratings & juror.ratings
      end
    end
    ratings_on
  end

  def has_ratings_on_stage?(stage)
    ratings_on_stage(stage).any?
  end
end
