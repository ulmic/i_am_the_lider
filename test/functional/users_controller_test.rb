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
    assert_not_nil assigns :users
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
    district = create :district
    attributes = attributes_for :user
    attributes[:district_id] = district.id

    post :create, user: attributes
    assert_redirected_to "/404"
  end

  test "should show user" do
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

  test "should sign_in user" do
    attributes = { login: @user.login, password: @user.password }
    post :login, attributes
    assert_response :redirect
  end

  test "should redirect because user is signed in" do
    user_sign_in @user
    attributes = { login: @user.login, password: @user.password }
    post :login, attributes
    assert_response :redirect
  end

  test "should not get new with no access" do
    get :new
    assert_redirected_to "/404"
  end

  test "should not create user with render new" do
    admin_sign_in @admin
    attributes = attributes_for :user
    attributes[:first_name] = nil

    post :create, user: attributes
    assert_template :new
  end  

#  test "should not update report with render edit" do
#    attributes = attributes_for :report
#    attributes[:venue] = nil
#    put :update, id: @report, report: attributes
#    assert_template /edit/
#  end

  test "should not sign in with wrong login or password" do
    attributes = attributes_for :user
    post :login, attributes
    assert_response :success
  end

  test "should sign out user" do
    post :logout
    assert_equal nil, session[:user_id]
  end
end
