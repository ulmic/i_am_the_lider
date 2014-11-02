class EventDecorator < Draper::Decorator
  delegate_all

  def can_edit?
    (model.begin_date.day - Time.now.day).abs >= 10
  end

  def happened?
    Time.now >= model.end_date
  end

  def participants_count
    model.report.participants.count
  end

end
