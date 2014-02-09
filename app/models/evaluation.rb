class Evaluation < ActiveRecord::Base
  attr_accessible :criterion_id, :value, :rating_id

  belongs_to :criterion
  belongs_to :rating

  validates :criterion_id, presence: true
  validates :value, presence: true
  validates :rating_id, presence: true
end
