module Participant::WelcomeHelper
  def participant_is_semifinalist?(user)
    stage = Stage.find_by_title(I18n.t('stages.time_of_real_deals'))
    if stage
      user.last_stage_id >= stage.id
    else
      false
    end
  end

  def user_event_happened?
    current_user.event and current_user.event.decorate.happened?
  end
end
