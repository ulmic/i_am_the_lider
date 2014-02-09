require 'test_helper'

class Juror::RatingsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @juror = create :juror
    @rating = create :rating
    @stage = create :stage
    juror_sign_in @juror
  end

  test "should get show" do
    get :show, id: @user
    assert_response :success
  end

  test "should get new" do
    get :new, id: @user
    assert_response :success
  end

  test "should post create" do
    attributes = attributes_for :rating
    post :create, rating: attributes
    assert_response :redirect
    assert_equal attributes[:user_id], Rating.last.user_id
  end

  test "should get edit" do
    get :edit, id: @rating
    assert_response :success
  end

  test "should put update" do
    attributes = attributes_for :rating
    put :update, id: @rating, rating: attributes
    assert_response :redirect
    @rating.reload
    assert_equal attributes[:user_id], @rating.user_id
  end
end
