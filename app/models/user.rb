#encoding: utf-8
class User < ActiveRecord::Base
  attr_accessible :birth_date,
                  :district_id,
                  :email,
                  :first_name,
                  :group,
                  :home_phone,
                  :last_name,
                  :login,
                  :middle_name,
                  :mobile_phone,
                  :password,
                  :school,
                  :twitter,
                  :vkontakte,
                  :avatar

  belongs_to :district
  has_one :project
  has_one :report
  has_many :blog_posts
  has_attached_file :avatar

  validates :birth_date, presence: true
  validates :district_id, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    email: true
  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true
  validates :mobile_phone, presence: true
  validates :vkontakte, url: true, 
                        allow_blank: true
  validates :twitter, url: true, 
                      allow_blank: true
  validates :login, presence: true
  validates :password, presence: true

  def title
    "#{first_name} #{middle_name} #{last_name}"
  end
  
  def small_name
    "#{first_name} #{middle_name}"
  end
end
