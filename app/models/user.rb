class User < ActiveRecord::Base
  attr_accessible :birth_date, :district_id, :email, :first_name, :group, :home_phone, :last_name, :login, :middle_name, :mobile_phone, 
                  :password, :school, :twitter, :vkontakte, :avatar

  belongs_to :district
  has_one :project
  has_one :report
  has_many :blog_posts
  has_attached_file :avatar

  validates_presence_of :birth_date, :district_id, :email, :first_name, :middle_name, :last_name, :login, :mobile_phone, :password, :avatar
  validates :email, :uniqueness => true	 	
  validates_email_format_of :email
  validates :login, :length => { :minimum => 3, :maximum => 8 }
  validates_format_of :login, :with => /^[-a-z]+$/
  validates :password, :length => { :minimum => 3, :maximum => 8 }
  validates_format_of :password, :with => /^[-a-z]+$/
  validates_url :vkontakte, :twitter, :allow_blank => true,
                            :allow_nil => true,
                            :message => "должен иметь формат ссылки"
  validate :mobile_phone, :phone_number => true
  validates_length_of :mobile_phone, :is => 11
  validates_attachment_content_type :avatar, :content_type => /image/,
                                             :message => "не является изображением"

  def title
    "#{first_name} #{middle_name} #{last_name}"
  end
  
  def small_name
    "#{first_name} #{middle_name}"
  end
end
