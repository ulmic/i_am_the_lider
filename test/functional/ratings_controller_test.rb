require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  setup do
    @rating = create :rating
  end

  test "should get index" do
    @rating.juror.stage.publish
    get :index, id: @rating.juror.stage
    assert_response :success
  end

  test "should not get index" do
    get :index, id: @rating.juror.stage
    assert_redirected_to not_found_errors_path
  end
end
