require 'test_helper'

class Admin::JurorsControllerTest < ActionController::TestCase
  setup do
    @juror = create :juror
    @stage = create :stage
    @admin = create :admin
    admin_sign_in @admin
  end

  test "should get index" do
    get :index, id: @stage
    assert_response :success
  end

  test "should get new" do
    get :new, id: @stage
    assert_response :success
  end

  test "should create juror" do
    attributes = attributes_for :juror
    attributes[:stage_id] = @stage.id
    post :create, juror: attributes, id: @stage
    assert_response :redirect

    juror = Juror.last
    assert_equal attributes[:first_name], juror.first_name
  end

  test "should not create juror" do
    attributes = { first_name: @juror.first_name }

    post :create, juror: attributes
    assert_response :success
  end

  test "should get edit by admin" do
    get :edit, id: @juror
    assert_response :success
  end

  test "should update juror by admin" do
    attributes = attributes_for :juror
    put :update, id: @juror, juror: attributes
    assert_response :redirect

    @juror.reload
    assert_equal attributes[:first_name], @juror.first_name
  end

  test "should not update juror with render edit" do
    attributes = attributes_for :juror
    attributes[:first_name] = nil
    put :update, id: @juror, juror: attributes

    assert_response :success

    assert_template :edit
  end

  test "should destroy juror" do
    assert_difference('Juror.count', -1) do
      delete :destroy, id: @juror
    end

    assert_redirected_to admin_jurors_path
  end
end
