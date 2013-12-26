require 'test_helper'

class EssesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @esse = create :esse
    @admin = create :admin
  end

  test "should get new" do
    user_sign_in @user

    get :new, id: @user
    assert_response :success
  end

  test "should get edit esse" do
    user_sign_in @user

    get :edit, id: @esse
    assert_response :success
  end

  test "should create esse" do
    user_sign_in @user

    attributes = attributes_for :esse
    binding.pry
    post :create, id: @user, esse: attributes
    assert_response :redirect

    @esse = Esse.last
    assert_equal attributes[:user_id], @esse.user_id
  end

  test "should update esse" do
    user_sign_in @user

    attributes = attributes_for :esse
    put :update, id: @esse, esse: attributes
    assert_response :redirect

    @esse.reload
    assert_equal attributes[:user_id], @esse.user_id
  end

  test "should destroy esse" do
    @user.id = @esse.user_id
    user_sign_in @user

    assert_difference('Esse.count', -1) do
      delete :destroy, id: @esse
    end
    user = @esse.user

    assert_redirected_to user_path user, flash: :success
  end

  test "should not edit esse with no access" do
    get :edit, id: @esse
    assert_redirected_to :root
  end

  test "should not create esse with render new" do
    user_sign_in @user
    attributes = attributes_for :esse
    attributes[:user_id] = nil

    post :create, esse: attributes, id: @user
    assert_template :new
  end

  test "should not update esse with no access" do
    attributes = attributes_for :esse
    put :update, id: @esse, esse: attributes

    assert_redirected_to user_path @esse.user
  end
end
