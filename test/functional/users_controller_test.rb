require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @district = create :district
    @user.district_id = @district.id
    @admin = create :admin
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    admin_sign_in @admin

    get :new
    assert_response :success
  end

  test "should create user" do
    admin_sign_in @admin

    district = create :district
    attributes = attributes_for :user
    attributes[:district_id] = district.id

    post :create, user: attributes
    assert_response :redirect

    user = User.last
    assert_equal attributes[:first_name], user.first_name
  end

  test "should not create user" do
    attributes = { email: @user.email, password: @user.password }

    post :create, user: attributes
    assert_response :success
  end

  test "should show user" do
    user_sign_in @user
    get :show, id: @user
    assert_response :success
  end

  test "should get edit by admin" do
    admin_sign_in @admin

    get :edit, id: @user
    assert_response :success
  end

  test "should update user by admin" do
    admin_sign_in @admin

    attributes = attributes_for :user
    put :update, id: @user, user: attributes
    assert_response :redirect

    @user.reload
    assert_equal attributes[:first_name], @user.first_name
  end

  test "should destroy user" do
    admin_sign_in @admin

    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

end
