module StageHelper
  def current_stage
    Stage.all.each do |stage|
      if Date.today >= stage.begin_date and Date.today <= stage.end_date
        return stage
      end
    end
    Stage.last
  end
end
