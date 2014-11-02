class Rating < ActiveRecord::Base
  attr_accessible :juror_id, :user_id, :evaluations_attributes

  include UsefullScopes

  belongs_to :user
  belongs_to :juror
  has_many :evaluations
  accepts_nested_attributes_for :evaluations

  validates :juror_id, presence: true
  validates :user_id, presence: true
end
