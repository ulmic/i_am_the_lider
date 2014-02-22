class Stage < ActiveRecord::Base
  next_record_order :id

  attr_accessible :description,
                  :title,
                  :begin_date,
                  :end_date,
                  :average

  has_many :criterions
  has_many :jurors
  has_many :users

  validates :title, presence: true
end
