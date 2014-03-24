require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = create :event
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @event
    assert_response :success
  end
end
