module WelcomeHelper
  def days_to_market_dream
    Stage.find_by_title("Ярмарка идей").begin_date - Date.today
  end
end
