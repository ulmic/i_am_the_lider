#encoding: utf-8
class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
    unless check_access_to_edit?(@report)
      redirect_to :root
    end
  end

  def create
    @report = Report.new(params[:report])
    if user_signed_in?
      @report.user_id = current_user.id
      if @report.save
        redirect_to @report.user, notice: 'Отчёт о мероприятии успешно добавлен.'
      else
        render action: "new"
      end
    end
  end

  def update
    @report = Report.find(params[:id])
    if check_access_to_edit?(@report)
      if @report.update_attributes(params[:report])
        redirect_to @report.user, notice: 'Запись в блоге обновлена.'
      else
        render action: "edit"
      end
    else
      redirect_to @report.user, notice: 'Вы не можете редактировать эту запись!'
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_url
  end
end
