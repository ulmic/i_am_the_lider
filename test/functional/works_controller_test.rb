require 'test_helper'

class WorksControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @work = create :work
    @admin = create :admin
  end

  test "should get new" do
    user_sign_in @user

    get :new, id: @user
    assert_response :success
  end

  test "should create work" do
    user_sign_in @user

    attributes = attributes_for :work
    post :create, id: @user, work: attributes
    assert_response :redirect

    @work = Work.last
    assert_equal @user.id, @work.user_id
  end

  test "should get edit" do
    @user.id = @work.user_id
    user_sign_in @user

    get :edit, id: @work
    assert_response :success
  end

  test "should update work" do
    user_sign_in @user

    attributes = attributes_for :work
    attributes[:user_id] = @user.id
    put :update, id: @work, work: attributes
    assert_response :redirect

    @work.reload
    assert_equal attributes[:user_id], @work.user_id
  end

  test "should not update work with render edit" do
    user_sign_in @user

    attributes = attributes_for :work
    attributes[:user_id] = nil
    put :update, id: @work, work: attributes
    assert_template :edit
  end

  test "should destroy work" do
    @user.id = @work.user_id
    user_sign_in @user

    assert_difference('Work.count', -1) do
      delete :destroy, id: @work
    end
    user = @work.user

    assert_redirected_to user_path user, flash: :success
  end

  test "should not edit work with no access" do
    get :edit, id: @work
    assert_redirected_to not_found_errors_path
  end

  test "should not update work with no access" do
    attributes = attributes_for :work
    put :update, id: @work, work: attributes

    assert_redirected_to not_found_errors_path
  end
end
