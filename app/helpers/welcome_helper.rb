module WelcomeHelper
  def market_dreams_coming_soon?
    Date.today < Stage.find_by_title(I18n.t('stages.market_dreams')).begin_date
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
    current_stage.title == I18n.t('stage.time_of_real_deals')
  end
end
