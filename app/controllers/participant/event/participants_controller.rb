class Participant::Event::ParticipantsController < Participant::Event::ApplicationController
  def new
    @participant = Event::Participant.new
  end

  def edit
    @participant = Event::Participant.find params[:id]
  end

  def create
    @participant = Event::Participant.new params[:event_participant]
    if @participant.save
      redirect_to participant_event_path(@participant), flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @participant = Event::Participant.find params[:id]
    if @participant.update_attributes params[:event_participant]
      redirect_to participant_event_path(@participant), flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @participant = Event::Participant.find params[:id]
    event = @participant.report.event
    @participant.destroy
    redirect_to participant_event_path(event), flash: :success
  end
end
