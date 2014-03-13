class Event < ActiveRecord::Base
  attr_accessible :adress, :begin_date, :description, :end_date, :goal, :participant_category, :tasks, :title
end
