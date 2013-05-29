class UserDecorator < Draper::Decorator
  delegate_all

  def district
    if district.present?
      model.district
    else
      District.first
    end
  end

  def school
    unless model.group.blank?
      h.content_tag :b, model.school
      h.content_tag :span, model.group
    end
  end
end
