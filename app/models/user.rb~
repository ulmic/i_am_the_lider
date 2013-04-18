class User < ActiveRecord::Base
  attr_accessible :birth_date, :district_id, :email, :first_name, :group, :home_phone, :last_name, :login, :middle_name, :mobile_phone, 
                  :password, :school, :twitter, :vkontakte, :avatar

  belongs_to :district
  has_attached_file :avatar

  validates_attachment :avatar, :presence => true
  validates_attachment_content_type :avatar, :content_type => /image/

  def title
    "#{first_name} #{middle_name} #{last_name}"
  end
end
