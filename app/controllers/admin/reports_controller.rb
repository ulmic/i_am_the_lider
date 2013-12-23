class Admin::ReportsController < Admin::ApplicationController
  def edit
    @report = Report.find params[:id]
  end

  def update
    @report = Report.find params[:id]
    if @report.update_attributes params[:report]
      redirect_to @report.user, notice: t('.report_updated')
    else
      render action: :edit
    end
  end

  def destroy
    @report = Report.find params[:id]
    @report.destroy
    redirect_to reports_url
  end
end
