require 'test_helper'

class Juror::SessionsControllerTest < ActionController::TestCase
  def setup
    @juror = create :juror
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    attrs = { login: @juror.login, password: @juror.password }
    post :create, juror: attrs
    assert_response :redirect

    assert juror_signed_in?
  end

  test "should not post create" do
    attrs = { login: "kuku", password: "123" }

    post :create, juror: attrs
    assert_response :success

    assert !juror_signed_in?
  end

  test "should delete destroy" do
    juror_sign_in @juror
    assert juror_signed_in?

    delete :destroy
    assert_response :redirect
  end
end
