require 'test_helper'

class Admin::ReserveReasonsControllerTest < ActionController::TestCase
  setup do
    @reserve_reason = create :reserve_reason
    @admin = create :admin
    admin_sign_in @admin
  end

  test "should create reserve_reason" do
    attributes = attributes_for :reserve_reason
    @user = create :user
    post :create, reserve_reason: attributes, id: @user
    assert_response :redirect

    @reserve_reason = ReserveReason.last
    assert_equal attributes[:description], @reserve_reason.description
  end

  test "should get edit reserve_reason" do
    get :edit, id: @reserve_reason
    assert_response :success
  end

  test "should update reserve_reason" do
    attributes = attributes_for :reserve_reason
    put :update, id: @reserve_reason, reserve_reason: attributes
    assert_response :redirect

    @reserve_reason.reload
    assert_equal attributes[:description], @reserve_reason.description
  end

  test "should destroy reserve_reason" do
    user = @reserve_reason.user
    assert_difference('ReserveReason.count', -1) do
      delete :destroy, id: @reserve_reason
    end

    assert_response :redirect
  end

  test "should not update reserve_reason with render edit" do
    attributes = attributes_for :reserve_reason
    attributes[:description] = nil
    put :update, id: @reserve_reason, reserve_reason: attributes
    assert_template :edit
  end
end
