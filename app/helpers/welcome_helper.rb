module WelcomeHelper
  def market_dreams_coming_soon?
    stage = Stage.find_by_title(I18n.t('stages.market_dreams'))
    Date.today < stage.begin_date if stage
  end

  def days_to_market_dreams
    days = Stage.find_by_title(I18n.t('stages.market_dreams')).begin_date.day - Date.today.day
    days.to_s + " " +
    #FIXME найти другой способ локализации
    Russian.p(days, I18n.t('days.day'), I18n.t('days.few_days'), I18n.t("days.many_days"))
  end

  def market_dreams_during?
    current_stage.title == I18n.t('stages.market_dreams')
  end

  def time_of_real_deals_during?
    current_stage.title == I18n.t('stages.time_of_real_deals')
  end

  def current_stage_ratings_published?
    current_stage.published? if current_stage
  end
end
