require 'test_helper'

class Admin::RatingsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    admin_sign_in @admin
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
