class Report < ActiveRecord::Base
  attr_accessible :date, :member_count, :member_type, :venue, :archive, :user_id
  
  belongs_to :user
  has_attached_file :archive
end
