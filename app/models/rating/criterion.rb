class Rating::Criterion < ActiveRecord::Base
  attr_accessible :maximum, :stage_number, :title

  validates :title, presence: true
  validates :stage_number, presence: true
  validates :maximum, presence: true
end
