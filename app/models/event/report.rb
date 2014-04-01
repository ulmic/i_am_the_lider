class Event::Report < ActiveRecord::Base
  attr_accessible :description, :document, :event_id, :results

  belongs_to :event

  mount_uploader :document, DocumentUploader

  validates :description, presence: true
  validates :document, presence: true
  validates :results, presence: true
end
