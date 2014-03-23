class EventDecorator < Draper::Decorator
  delegate_all

  def can_edit?
    (model.begin_date.day - Time.now.day).abs >= 10
  end

end
