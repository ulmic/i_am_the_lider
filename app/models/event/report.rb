class Event::Report < ActiveRecord::Base
  attr_accessible :description, :document, :event_id, :results, :participants_attributes

  belongs_to :event
  has_many :participants, class_name: "Event::Participant"

  mount_uploader :document, DocumentUploader

  validates :description, presence: true
  validates :document, presence: true
  validates :results, presence: true
end
