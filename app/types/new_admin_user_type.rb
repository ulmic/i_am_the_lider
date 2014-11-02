class NewAdminUserType < User
  include ApplicationType

  attr_accessor :password
  validates :password, presence: true, length: { minimum: 8, maximum: 16 }
end
