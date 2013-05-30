#encoding: utf-8
class Report < ActiveRecord::Base
  attr_accessible :date, :member_count, :member_type, :venue, :archive, :user_id, :description
  
  belongs_to :user
  has_attached_file :archive

  validates :user_id, :presence => true
  validates :description, :presence => true
  validates :venue, :presence => true
  validates :member_count, :numericality => { :greater_than => 0 },
                           :allow_blank => true
end
