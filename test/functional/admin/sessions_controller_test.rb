require 'test_helper'

class Admin::SessionsControllerTest < ActionController::TestCase
  def setup
    @admin = create :admin
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    attrs = { login: @admin.login, password: @admin.password }
    post :create, admin: attrs
    assert_response :redirect

    assert admin_signed_in?
  end

  test "should not post create" do
    attrs = { login: "kuku", password: "123" }

    post :create, admin: attrs
    assert_response :success

    assert !admin_signed_in?
  end

  test "should delete destroy" do
    admin_sign_in @admin
    assert admin_signed_in?

    delete :destroy
    assert_response :redirect
  end
end
