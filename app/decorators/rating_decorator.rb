class RatingDecorator < Draper::Decorator
  delegate_all

  def sum
    sum = 0
    model.evaluations.each do |eval|
      sum += eval.value
    end
    sum
  end

end
