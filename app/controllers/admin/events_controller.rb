class Admin::EventsController < Admin::ApplicationController
  def show
    @event = Event.find_by_user_id(params[:id]).decorate
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find params[:id]
  end

  def create
    @event = Event.new params[:event]
    if @event.save
      redirect_to participant_event_path(@event), flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @event = Event.find params[:id]
    if @event.update_attributes params[:event]
      redirect_to participant_event_path(@event), flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @event = Event.find params[:id]
    user = @event.user
    @event.destroy
    redirect_to participant_welcome_index_path(user), flash: :success
  end
end
