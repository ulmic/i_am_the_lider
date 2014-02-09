class Rating < ActiveRecord::Base
  attr_accessible :juror_id, :user_id

  belongs_to :user
  belongs_to :juror
  has_many :evaluations

  validates :juror_id, presence: true
  validates :user_id, presence: true
end
