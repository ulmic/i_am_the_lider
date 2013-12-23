require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  setup do
    @news = create :news
    @admin = create :admin
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns :news
  end

  test "should show news" do
    get :show, id: @news
    assert_response :success
  end
end
