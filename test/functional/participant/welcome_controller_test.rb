require 'test_helper'

class Participant::WelcomeControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get index" do
    user_sign_in @user
    get :index, id: @user
    assert_response :success
  end

  test "should not get index" do
    get :index, id: @user
    assert_redirected_to not_found_errors_path
  end
end
