class EditAdminUserType < User
  include ApplicationType

  attr_accessor :password
end
