class Admin::ParticipantsController < Admin::ApplicationController
  def index
    @participants = Event::Participant.all
  end

  def new
    @participant = Event::Participant.new
  end

  def create
    @participant = Event::Participant.new params[:event_participant]
    if @participant.save
      redirect_to admin_event_path(@participant.report.event), flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def destroy
    @participant = Event::Participant.find params[:id]
    @participant.destroy
    redirect_to admin_participants_path, flash: :success
  end
end
