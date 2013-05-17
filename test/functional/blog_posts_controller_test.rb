require 'test_helper'

class BlogPostsControllerTest < ActionController::TestCase
  setup do
    @blog_post = create :blog_post
    @user = create :user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blog_posts)
  end

  test "should get new" do
    user = create :user
    user_sign_in(user)

    get :new
    assert_response :success
  end

  test "should create blog_post" do
    user = create :user
    user_sign_in(user)
    
    attributes = attributes_for :blog_post
    attributes[:user_id] = user.id

    post :create, blog_post: attributes
    assert_response :redirect

    @blog_post = BlogPost.last
    assert_equal attributes[:title], @blog_post.title
  end

  test "should show blog_post" do
    get :show, id: @blog_post
    assert_response :success
  end

  test "should update blog_post" do    
    attributes = attributes_for :blog_post
    put :update, id: @blog_post, blog_post: attributes
    assert_response :redirect
    
    @blog_post.reload
    assert_equal attributes[:title], @blog_post.title
  end

  test "should destroy blog_post by admin" do
    @admin = Admin.first
    admin_sign_in(@admin)

    assert_difference('BlogPost.count', -1) do
      delete :destroy, id: @blog_post
    end

    assert_redirected_to blog_posts_path
  end
end
