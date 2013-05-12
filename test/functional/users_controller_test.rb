require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    @admin = Admin.first
    admin_sign_in(@admin)

    get :new
    assert_response :success
  end

  test "should create user" do
    @admin = Admin.first
    admin_sign_in(@admin)
    
    district = create :district
    attributes = attributes_for :user
    attributes[:district_id] = district.id

    post :create, user: attributes
    assert_response :redirect

    @user = User.last
    assert_equal attributes[:first_name], @user.first_name
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    @admin = Admin.first
    admin_sign_in(@admin)    

    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    @admin = Admin.first
    admin_sign_in(@admin)   
 
    attributes = attributes_for :user
    put :update, id: @user, user: attributes
    assert_response :redirect

    @user.reload
    assert_equal attributes[:first_name], @user.first_name
  end

  test "should destroy user" do
    @admin = Admin.first
    admin_sign_in(@admin)    

    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "should sign_in user" do
    @user = User.first
    attributes = { login: @user.login, password: @user.password }
    post :login, attributes
    assert_response :redirect 
  end
end
