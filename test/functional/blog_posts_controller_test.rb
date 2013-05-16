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

  test "should get new by admin" do
    @admin = Admin.first
    admin_sign_in(@admin)

    get :new
    assert_response :success
  end

  test "should create blog_post by admin" do
    @admin = Admin.first
    admin_sign_in(@admin)
    
    user = create :user
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

  test "should get edit" do
    @admin = Admin.first
    admin_sign_in(@admin)    

    user_sign_in @user
    new_blog_post = create :blog_post, user_id: @user.id
    get :edit, id: new_blog_post
    assert_response :success
  end

  test "should update blog_post" do
    @admin = Admin.first
    admin_sign_in(@admin)   
 
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
