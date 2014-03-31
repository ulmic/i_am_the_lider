class NewAdminUserType < User
  include ApplicationType

  validates :password, presence: true, length: { minimum: 8, maximum: 16 }
end
