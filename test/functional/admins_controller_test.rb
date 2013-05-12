require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
  end

  test "should sign_in admin" do
    @admin = Admin.first
    attributes = { login: @admin.login, password: @admin.password }
    post :login, attributes
    assert_response :redirect 
  end
end
