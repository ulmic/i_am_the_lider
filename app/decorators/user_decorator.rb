class UserDecorator < Draper::Decorator
  delegate_all

  def title
    "#{model.first_name} #{model.middle_name} #{model.last_name}"
  end

  def small_name
    "#{model.first_name} #{model.middle_name}"
  end

end
