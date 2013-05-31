#encoding: utf-8
class Admin < ActiveRecord::Base
  attr_accessible 	:login, 
			:password

  validates :login, 	presence: true,
                    	uniqueness: true
  validates :password, 	presence: true
end
