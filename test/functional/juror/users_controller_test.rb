require 'test_helper'

class Juror::UsersControllerTest < ActionController::TestCase
  setup do
    @juror = create :juror
    juror_sign_in @juror
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
