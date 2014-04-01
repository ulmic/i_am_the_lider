class Admin::ReportsController < Admin::ApplicationController
  def index
    @reports = Event::Report.all
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
      redirect_to admin_event_path(@report.event), flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @report = Event::Report.find params[:id]
    if @report.update_attributes params[:report]
      redirect_to admin_reports_path, flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @report = Event::Report.find params[:id]
    @report.destroy
    redirect_to admin_reports_path, flash: :success
  end
end
