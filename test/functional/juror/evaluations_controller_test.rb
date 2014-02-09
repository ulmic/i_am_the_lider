require 'test_helper'

class Juror::EvaluationsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @stage = create :stage
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

  test "should destroy evaluation" do
    user = @evaluation.user
    assert_difference('Evaluation.count', -1) do
      delete :destroy, id: @evaluation
    end

    assert_redirected_to juror_evaluations_path user
  end
end
