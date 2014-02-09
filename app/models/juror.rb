class Juror < ActiveRecord::Base
  attr_accessible :first_name,
                  :last_name,
                  :login,
                  :password

  has_many :evaluations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :login, presence: true,
                    uniqueness: true,
                    length: { minimum: 3, maximum: 16 }
  validates :password, presence: true,
                       length: { minimum: 4, maximum: 16 }
end
