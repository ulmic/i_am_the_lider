require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @admin = create :admin
    admin_sign_in @admin
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get index xls" do
    get :index, format: :xls
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    attributes = attributes_for :user
    district = create :district
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
    get :show, id: @user
    assert_response :success
  end

  test "should get edit by admin" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user by admin" do
    attributes = attributes_for :user
    put :update, id: @user, user: attributes
    assert_response :redirect

    @user.reload
    assert_equal attributes[:first_name], @user.first_name
  end

  test "should not update user with render edit" do
    attributes = attributes_for :user
    attributes[:first_name] = nil
    put :update, id: @user, user: attributes

    assert_response :success

    assert_template :edit
  end

  test "should destroy user" do
    delete :destroy, id: @user
    @user.reload
    assert @user.busted?
    assert_redirected_to users_path
  end

  test "should accept user" do
    put :accept, id: @user
    @user.reload
    assert @user.accepted?
  end

  test "should reserve user" do
    put :reserve, id: @user
    @user.reload
    assert @user.reserved?
  end
end
