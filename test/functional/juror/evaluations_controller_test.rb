require 'test_helper'

class Juror::EvaluationsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @evaluation = create :evaluation
    @juror = create :juror
    juror_sign_in @juror
  end

  test "should get index" do
    get :index, id: @user
    assert_response :success
  end

  test "should post create" do
    attributes = attributes_for :evaluation
    post :create, evaluation: attributes
    assert_equal attributes[:value], Evaluation.last.value
  end

  test "should put update" do
    attributes = attributes_for :evaluation
    put :update, id: @evaluation, evaluation: attributes
    @evaluation.reload
    assert_equal attributes[:value], @evaluation.value
  end
end
