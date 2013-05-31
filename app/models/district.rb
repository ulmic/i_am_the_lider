#encoding: utf-8
class District < ActiveRecord::Base
  attr_accessible :title

  has_many :users
 
  validates :title, presence: true
end
