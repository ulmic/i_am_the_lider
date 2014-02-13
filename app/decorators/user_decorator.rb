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

  def has_entered?(stage)
    if stage.average
      if average_eval >= stage.average
        I18n.t('admin.ratings.index.has_entered_to_next_stage')
      else
        I18n.t('admin.ratings.index.has_not_entered_to_next_stage')
      end
    else
      h.content_tag :a, class: 'btn btn-info',
                           href: "/admin/stages/#{stage.id}/edit" do
        I18n.t('admin.ratings.index.add_stage_average')
      end
    end
  end
end
