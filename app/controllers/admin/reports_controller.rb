class Admin::ReportsController < Admin::ApplicationController
  def edit
    @report = Report.find params[:id]
  end

  def update
    @report = Report.find params[:id]
    if @report.update_attributes params[:report]
      flash_now! :success
      redirect_to @report.user, notice: t('.report_updated')
    else
      flash_now! :error
      render action: :edit
    end
  end

  def destroy
    @report = Report.find params[:id]
    @report.destroy
    flash_now! :success
    redirect_to reports_url
  end
end
