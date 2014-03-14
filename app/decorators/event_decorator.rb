class EventDecorator < Draper::Decorator
  delegate_all

  def latitude
    if model.coordinates.present?
      model.coordinates.split(',')[0]
    end
  end

  def longitude
    if model.coordinates.present?
      model.coordinates.split(' ')[1]
    end
  end
end
