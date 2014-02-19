class User < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :birth_date,
                  :district_id,
                  :email,
                  :first_name,
                  :group,
                  :home_phone,
                  :last_name,
                  :middle_name,
                  :mobile_phone,
                  :password,
                  :school,
                  :twitter,
                  :vkontakte,
                  :avatar,
                  :locality,
                  :adress_index,
                  :confirm_state,
                  :last_stage_id

  belongs_to :district
  belongs_to :last_stage, class_name: "Stage"
  has_one :reserve_reason
  has_one :work
  has_one :report
  has_many :blog_posts
  has_many :ratings
  mount_uploader :avatar, PhotoUploader, mount_on: :avatar_file_name

  validates :birth_date, presence: true,
                         inclusion: { in: Time.now.years_ago(21).to_date..Time.now.years_ago(14).to_date}
  validates :district_id, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    email: true
  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true
  validates :home_phone, phone: true, allow_blank: true
  validates :mobile_phone, presence: true, phone: true
  validates :vkontakte, url: true,
                        allow_blank: true
  validates :twitter, url: true,
                      allow_blank: true
  validates :password, presence: true, length: { minimum: 8, maximum: 16 }
  validates :adress_index, presence: true, length: { is: 6 }
  validates :locality, presence: true
  validates :avatar, presence: true
  validates :confirm_state, presence: true

  include UsefullScopes

  state_machine :confirm_state, initial: :new do
    state :new
    state :accepted
    state :busted
    state :reserved

    event :accept do
      transition [ :new, :reserved ] => :accepted
    end

    event :bust do
      transition [ :new, :reserved ] => :busted
    end

    event :reserve do
      transition [ :new, :accepted ] => :reserved
    end

  end

end
