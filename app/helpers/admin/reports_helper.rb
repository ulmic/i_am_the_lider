module Admin::ReportsHelper
  def events_without_reports
    Event.all.select { |event| event.report.nil? }
  end
end
