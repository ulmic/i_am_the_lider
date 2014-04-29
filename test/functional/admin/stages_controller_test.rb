require 'test_helper'

class Admin::StagesControllerTest < ActionController::TestCase
  setup do
    @stage = create :stage
    @admin = create :admin
    admin_sign_in @admin
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stage" do
    attributes = attributes_for :stage

    post :create, stage: attributes
    assert_response :redirect

    stage = Stage.last
    assert_equal attributes[:title], stage.title
  end

  test "should not create stage" do
    attributes = { description: @stage.description }

    post :create, stage: attributes
    assert_response :success
  end

  test "should get edit by admin" do
    get :edit, id: @stage
    assert_response :success
  end

  test "should update stage by admin" do
    attributes = attributes_for :stage
    put :update, id: @stage, stage: attributes
    assert_response :redirect

    @stage.reload
    assert_equal attributes[:title], @stage.title
  end

  test "should not update stage with render edit" do
    attributes = attributes_for :stage
    attributes[:title] = nil
    put :update, id: @stage, stage: attributes

    assert_response :success

    assert_template :edit
  end

  test "should destroy stage" do
    assert_difference('Stage.count', -1) do
      delete :destroy, id: @stage
    end

    assert_redirected_to admin_stages_path
  end

  test "should publish ratings stage" do
    put :publish, id: @stage
    assert_response :redirect
  end

  test "should unpublish ratings stage" do
    put :unpublish, id: @stage
    assert_response :redirect
  end
end
