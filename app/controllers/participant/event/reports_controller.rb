class Participant::Event::ReportsController < ApplicationController
  def show
    @report = Event::Report.find_by_event_id Event.find_by_user_id(params[:id]).id
  end

  def new
    @report = Event::Report.new
  end

  def edit
    @report = Event::Report.find params[:id]
  end

  def create
    @report = Event::Report.new params[:report]
    if @report.save
      redirect_to participant_event_path(@report), flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @report = Event::Report.find params[:id]
    if @report.update_attributes params[:report]
      redirect_to participant_event_path(@report), flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @report = Event::Report.find params[:id]
    user = @report.event.user
    @report.destroy
    redirect_to participant_welcome_index_path(user), flash: :success
  end

end
