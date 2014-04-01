class Event::Participant < ActiveRecord::Base
  attr_accessible :report_id,
                  :full_name,
                  :group,
                  :phone,
                  :school

  belongs_to :report

  validates :report_id, presence: true
  validates :full_name, presence: true
  validates :phone, presence: true, phone: true
end
