class Evaluation < ActiveRecord::Base
  attr_accessible :criterion_id, :juror_id, :participant_id, :value

  belongs_to :criterion
  belongs_to :juror
  belongs_to :participant, class_name: "User"

  validates :criterion_id, presence: true
  validates :juror_id, presence: true
  validates :participant_id, presence: true
  validates :value, presence: true
end
