class JurorDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{model.first_name} #{model.last_name}"
  end
end
