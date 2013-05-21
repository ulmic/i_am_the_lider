require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
  end

  test "should sign_in admin" do
    attributes = { login: @admin.login, password: @admin.password }
    post :login, attributes
    assert_response :redirect
  end

  test "should sign_out admin" do
    post :logout
    assert_equal nil, session[:admin_id]
  end
end
