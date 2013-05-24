class Report < ActiveRecord::Base
  attr_accessible :date, :member_count, :member_type, :venue, :archive, :user_id, :description
  
  validates_presence_of :user_id, :description
  validates_numericality_of :member_count, :greater_than => 0, :allow_blank => :true   
  belongs_to :user
  has_attached_file :archive
end
