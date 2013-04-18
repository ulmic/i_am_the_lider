class Project < ActiveRecord::Base
  attr_accessible :date, :description, :goal, :place, :results, :target_audience, :tasks, :title

  belongs_to :user
end
