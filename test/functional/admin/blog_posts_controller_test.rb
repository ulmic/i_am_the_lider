require 'test_helper'

class Admin::BlogPostsControllerTest < ActionController::TestCase
  setup do
    @blog_post = create :blog_post
    @admin = create :admin
    admin_sign_in @admin
  end

  test "should get index" do
    get :index, id: @user
    assert_response :success
  end

  test "should get edit blog_post by admin" do
    get :edit, id: @blog_post
    assert_response :success
  end

  test "should get edit blog_post by user" do
    get :edit, id: @blog_post
    assert_response :success
  end

  test "should update blog_post" do
    attributes = attributes_for :blog_post
    put :update, id: @blog_post, blog_post: attributes
    assert_response :redirect

    @blog_post.reload
    assert_equal attributes[:title], @blog_post.title
  end

  test "should not update blog_post" do
    attributes = attributes_for :blog_post
    attributes[:title] = nil
    put :update, id: @blog_post, blog_post: attributes
    assert_response :success

    assert_template :edit
  end


  test "should destroy blog_post" do
    assert_difference('BlogPost.count', -1) do
      delete :destroy, id: @blog_post
    end

    assert_redirected_to admin_blog_posts_path
  end

end
