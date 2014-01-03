require 'test_helper'

class Admin::ReportsControllerTest < ActionController::TestCase
  setup do
    @report = create :report
    @admin = create :admin
    admin_sign_in @admin
  end

  test "should get edit report" do
    get :edit, id: @report
    assert_response :success
  end

  test "should update report" do
    attributes = attributes_for :report
    put :update, id: @report, report: attributes
    assert_response :redirect

    @report.reload
    assert_equal attributes[:description], @report.description
  end

  test "should not update report with render edit" do
    attributes = attributes_for :report
    attributes[:venue] = nil
    put :update, id: @report, report: attributes
    assert_template :edit
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to reports_path
  end

end
