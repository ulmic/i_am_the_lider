module WelcomeHelper
  def market_dreams_coming_soon?
    Date.today < Stage.find_by_title("Ярмарка идей").begin_date
  end

  def days_to_market_dreams
    days = Stage.find_by_title("Ярмарка идей").begin_date.day - Date.today.day
    days.to_s + " " +
    Russian.p(days - 9, "день", "дня", "дней")
  end
end
