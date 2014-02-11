module WelcomeHelper
  def market_dreams_coming_soon?
    raise Stage.find_by_title("Ярмарка идей").begin_date.inspect
    Date.today < Stage.find_by_title("Ярмарка идей").begin_date
  end

  def days_to_market_dreams
    Stage.find_by_title("Ярмарка идей").begin_date - Date.today
  end
end
