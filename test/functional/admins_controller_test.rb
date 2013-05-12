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

  test "should sign_out admin" do
    post :logout
    assert_equal nil, session[:admin_id]
  end

  #test "should confirm user" do
  #  @admin = Admin.first
  #  @user = User.first
  #  attributes = { id: @user.id }
  #  post :confirm_user, attributes
  #  assert_response :redirect
   
  #  @user.reload
  #  assert_equal true, @user.confirm 
  #end
end
