class Juror < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_many :evaluations

  validates :first_name, presence: true
  validates :last_name, presence: true
end
