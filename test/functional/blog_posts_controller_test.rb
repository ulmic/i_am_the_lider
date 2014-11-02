require 'test_helper'

class BlogPostsControllerTest < ActionController::TestCase
  setup do
    @blog_post = create :blog_post
    @user = create :user
  end

  test "should get index" do
    get :index, id: @user
    assert_response :success
  end

  test "should show blog_post" do
    get :show, id: @blog_post
    assert_response :success
  end

end
