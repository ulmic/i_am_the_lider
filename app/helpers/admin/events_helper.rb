module Admin::EventsHelper
  def users_without_events
    User.with(last_stage_id: current_stage.id).select { |user| user.event.nil? }
  end
end
