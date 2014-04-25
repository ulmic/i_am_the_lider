module Admin::EventsHelper
  def users_without_events
    if current_stage
      User.with(last_stage_id: current_stage.id).select { |user| user.event.nil? }
    else
      User.all
    end
  end
end
