class Stage < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :criterions

  validates :title, presence: true
  validates :description, presence: true
end
