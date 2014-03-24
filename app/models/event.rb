class Event < ActiveRecord::Base
  geocoded_by :adress
  #after_validation :geocode, if: :adress_changed?

  attr_accessible :adress,
                  :begin_date,
                  :description,
                  :end_date,
                  :goal,
                  :participant_category,
                  :tasks,
                  :title,
                  :user_id,
                  :latitude,
                  :longtitude

  belongs_to :user

  validates :adress, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true,
                          length: { maximum: 1000 }
  validates :goal, presence: true
  validates :participant_category, presence: true
  validates :tasks, presence: true
  validates :title, presence: true,
                    length: { maximum: 140 }
  validates :user_id, presence: true

  #FIXME for simple calendar gem
  def start_time
    begin_date
  end
end
