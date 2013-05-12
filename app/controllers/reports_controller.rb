#encoding: utf-8
class ReportsController < ApplicationController
  before_filter :check_if_admin, only: [:edit, :update, :destroy]  

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(params[:report])
    @report.user_id = session[:user_id]

    respond_to do |format|
      if @report.save
        format.html { redirect_to "/office", notice: 'Отчёт о мероприятии успешно добавлен.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to "/office", notice: 'Отчёт о мероприятии успешно обновлён.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end
end
