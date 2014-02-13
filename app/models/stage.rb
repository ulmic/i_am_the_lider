class Stage < ActiveRecord::Base
  attr_accessible :description,
                  :title,
                  :begin_date,
                  :end_date,
                  :average

  has_many :criterions
  has_many :jurors

  validates :title, presence: true
end
