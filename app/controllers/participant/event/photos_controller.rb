class Participant::Event::PhotosController < Participant::Event::ApplicationController
  def new
    @photo = Event::Photo.new
  end

  def create
    @photo = Event::Photo.new params[:event_photo]
    if @photo.save
      redirect_to participant_event_path(@photo), flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def destroy
    @photo = Event::Photo.find params[:id]
    event = @photo.report.event
    @photo.destroy
    redirect_to participant_event_path(event), flash: :success
  end
end
