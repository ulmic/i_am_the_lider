class Criterion < ActiveRecord::Base
  attr_accessible :maximum, :stage_id, :title

  belongs_to :stage
  has_many :evaluations

  validates :title, presence: true
  validates :stage_id, presence: true
  validates :maximum, presence: true
end
