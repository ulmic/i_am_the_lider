class Event::ReportDecorator < Draper::Decorator
  delegate_all

  def author
    model.event.user.decorate
  end
end
