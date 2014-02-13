class RatingDecorator < Draper::Decorator
  delegate_all

  def average_eval
    sum = 0
    model.evaluations.each do |eval|
      sum += evaluations.value
    end
    average = sum / model.evaluations.count
  end

end
