require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  setup do
    @rating = create :rating
  end

  test "should get index" do
    get :index, id: @rating.juror.stage
    assert_response :success
  end
end
