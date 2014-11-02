module UsersHelper
  def time_to_be_the_lider_during?
    stage = Stage.find_by_title("stages.time_to_be_the_lider")
    if stage
      current_stage.title == stage.title
    else
      false
    end
  end
end
