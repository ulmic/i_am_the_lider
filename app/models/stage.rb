class Stage < ActiveRecord::Base
  next_record_order :id

  attr_accessible :description,
                  :title,
                  :begin_date,
                  :end_date,
                  :average,
                  :ratings_publish_state

  has_many :criterions
  has_many :jurors
  has_many :users

  validates :title, presence: true

  state_machine :ratings_publish_state, initial: :not_published do
    state :not_published
    state :published

    event :publish do
      transition not_published: :published
    end

    event :unpublish do
      transition published: :not_published
    end
  end
end
