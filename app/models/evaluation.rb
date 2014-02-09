class Evaluation < ActiveRecord::Base
  attr_accessible :criterion_id, :juror_id, :user_id, :value

  belongs_to :criterion
  belongs_to :juror
  belongs_to :user

  validates :criterion_id, presence: true
  validates :juror_id, presence: true
  validates :user_id, presence: true
  validates :value, presence: true
end
