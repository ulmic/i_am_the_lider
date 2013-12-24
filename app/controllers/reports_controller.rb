#encoding: utf-8
class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def show
    @report = Report.find params[:id]
    redirect_to @report.user
  end

  def edit
    @report = Report.find params[:id]
    unless check_access_to_edit? @report
      redirect_to :root
    end
  end

  def create
    @report = Report.new params[:report]
    if user_signed_in?
      @report.user_id = params[:id]
      if @report.save
        flash_now! :success
        redirect_to @report.user
      else
        flash_now! :error
        render action: :new
      end
    else
      redirect_to User.find params[:id]
    end
  end

  def update
    @report = Report.find params[:id]
    if check_access_to_edit? @report
      if @report.update_attributes params[:report]
        flash_now! :success
        redirect_to @report.user
      else
        flash_now! :error
        render action: :edit
      end
    else
      redirect_to @report.user, notice: t('without_access_to_edit')
    end
  end

  def destroy
    @report = Report.find params[:id]
    @report.destroy
    flash_now! :success
    redirect_to reports_url
  end
end
