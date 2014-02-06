require 'test_helper'

class Admin::CriterionsControllerTest < ActionController::TestCase
  setup do
    @criterion = create :rating_criterion
    @admin = create :admin
    @stage = create :stage
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

  test "should create criterion" do
    attributes = attributes_for :rating_criterion
    attributes[:stage_id] = 1

    post :create, id: @stage, criterion: attributes
    assert_response :redirect

    criterion = Rating::Criterion.last
    assert_equal attributes[:title], criterion.title
  end

  test "should not create criterion" do
    attributes = { title: @criterion.title }

    post :create, id: @stage, criterion: attributes
    assert_response :success
  end

  test "should get edit by admin" do
    get :edit, id: @criterion
    assert_response :success
  end

  test "should update criterion by admin" do
    attributes = attributes_for :rating_criterion
    put :update, id: @criterion, criterion: attributes
    assert_response :redirect

    @criterion.reload
    assert_equal attributes[:title], @criterion.title
  end

  test "should not update criterion with render edit" do
    attributes = attributes_for :rating_criterion
    attributes[:title] = nil
    put :update, id: @criterion, criterion: attributes

    assert_response :success

    assert_template :edit
  end

  test "should destroy criterion" do
    assert_difference('Rating::Criterion.count', -1) do
      delete :destroy, id: @criterion
    end

    assert_redirected_to admin_criterions_path
  end
end
