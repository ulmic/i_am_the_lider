module StageHelper
  def current_stage
    stage_id = 1
    Rating.all.each do |rating|
      stage_id = rating.juror.stage_id if rating.juror.stage_id >= stage_id
    end
    stage = Stage.find stage_id
  end
end
