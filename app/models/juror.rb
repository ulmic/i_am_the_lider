class Juror < ActiveRecord::Base
  include UsefullScopes
  attr_accessible :first_name,
                  :last_name,
                  :login,
                  :password,
                  :stage_id

  has_many :ratings
  belongs_to :stage

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :login, presence: true,
                    uniqueness: true,
                    length: { minimum: 3, maximum: 16 }
  validates :password, presence: true,
                       length: { minimum: 4, maximum: 16 }
  validates :stage_id, presence: true
end
