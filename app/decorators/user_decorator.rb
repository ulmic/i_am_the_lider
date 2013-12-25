class UserDecorator < Draper::Decorator
  delegate_all

  def title
    "#{model.first_name} #{model.middle_name} #{model.last_name}"
  end

  def small_name
    "#{model.first_name} #{model.middle_name}"
  end

  def confirm_state_locales
    if model.confirm_state == "new"
      I18n.t('new_user')
    elsif model.confirm_state == "accepted"
      I18n.t('accepted_user')
    elsif model.confirm_state == "reserved"
      I18n.t('reserver_user')
    elsif model.confirm_state == "busted"
      I18n.t('busted_user')
    end
  end
end
