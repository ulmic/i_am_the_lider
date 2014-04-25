class Admin::EventsController < Admin::ApplicationController
  def show
    @event = Event.find(params[:id]).decorate
  end

  def index
    @events = Event.all
  end

  def new
    if not current_stage or (current_stage and User.with(last_stage_id: current_stage.id).select { |user| user.event.nil? }.any?)
      @event = Event.new
    else
      redirect_to new_admin_user_path, flash: :error
    end
  end

  def edit
    @event = Event.find_by_user_id params[:id]
  end

  def create
    @event = Event.new params[:event]
    if @event.save
      redirect_to admin_event_path(@event), flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @event = Event.find params[:id]
    if @event.update_attributes params[:event]
      redirect_to admin_event_path(@event), flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @event = Event.find params[:id]
    user = @event.user
    @event.destroy
    redirect_to admin_welcome_index_path, flash: :success
  end
end
