#encoding: utf-8
class Admin < ActiveRecord::Base
  attr_accessible :login, :password

  validates_presence_of :login, :password
  validates_uniqueness_of :login
end
