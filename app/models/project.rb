class Project < ActiveRecord::Base
  attr_accessible :date, :description, :goal, :place, :results, :target_audience, :tasks, :title, :user_id

  belongs_to :user
end
