class Report < ActiveRecord::Base
  attr_accessible :date, :member_count, :member_type, :venue, :archive
  
  has_attached_file :archive
end
