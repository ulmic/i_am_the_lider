require 'test_helper'

class BlogPostsControllerTest < ActionController::TestCase
  setup do
    @blog_post = create :blog_post
    @user = create :user
    @admin = create :admin
  end

  test "should get index" do
    get :index, id: @user
    assert_response :success
  end

  test "should get edit blog_post by admin" do
    admin_sign_in @admin

    get :edit, id: @blog_post
    assert_response :success
  end

  test "should get edit blog_post by user" do
    @user.id = @blog_post.user_id
    user_sign_in @user

    get :edit, id: @blog_post
    assert_response :success
  end

  test "should not get edit blog_post" do
    get :edit, id: @blog_post
    assert_response :redirect
  end

  test "should not create blog_post" do
    attributes = attributes_for :blog_post

    post :create, blog_post: attributes, id: @user
    assert_redirected_to not_found_errors_path
  end

  test "should get new" do
    user_sign_in @user

    get :new, id: @user
    assert_response :success
  end

  test "should not get new" do
    get :new, id: @user
    assert_redirected_to not_found_errors_path
  end

  test "should create blog_post" do
    user_sign_in @user

    attributes = attributes_for :blog_post
    attributes[:user_id] = @user.id

    post :create, blog_post: attributes, id: @user
    assert_response :redirect

    @blog_post = BlogPost.last
    assert_equal attributes[:title], @blog_post.title
  end

  test "should show blog_post" do
    get :show, id: @blog_post
    assert_response :success
  end

  test "should update blog_post" do
    @user.id = @blog_post.id
    user_sign_in @user

    attributes = attributes_for :blog_post
    put :update, id: @blog_post, blog_post: attributes
    assert_response :redirect

    @blog_post.reload
    assert_equal attributes[:title], @blog_post.title
  end

  test "should update blog_post by admin" do
    admin_sign_in @admin

    attributes = attributes_for :blog_post
    put :update, id: @blog_post, blog_post: attributes
    assert_response :redirect

    @blog_post.reload
    assert_equal attributes[:title], @blog_post.title
  end

  test "should destroy blog_post" do
    @user.id = @blog_post.user_id
    user_sign_in @user

    assert_difference('BlogPost.count', -1) do
      delete :destroy, id: @blog_post
    end

    assert_redirected_to blog_posts_path
  end

  test "should destroy blog_post by admin" do
    admin_sign_in @admin

    assert_difference('BlogPost.count', -1) do
      delete :destroy, id: @blog_post
    end

    assert_redirected_to blog_posts_path
  end

  test "should not create blog_post with render new" do
    user_sign_in @user
    attributes = attributes_for :blog_post
    attributes[:title] = nil

    post :create, blog_post: attributes, id: @user
    assert_template :new
  end

  test "should not update blog_post with no access" do
    attributes = attributes_for :blog_post
    put :update, id: @blog_post, blog_post: attributes

    assert_redirected_to @blog_post
  end

  test "should not destroy blog_post with no access" do
    assert_difference('BlogPost.count', 0) do
      delete :destroy, id: @blog_post
    end

    assert_redirected_to @blog_post.user
  end
end
