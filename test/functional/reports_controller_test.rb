require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @report = create :report
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report" do
    attributes = attributes_for :report
    post :create, report: attributes
    assert_response :redirect

    @report = Report.last
    assert_equal attributes[:description], @report.description
  end

  test "should show report" do
    get :show, id: @report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report
    assert_response :success
  end

  test "should update report" do
    put :update, id: @report, report: { date: @report.date, member_count: @report.member_count, member_type: @report.member_type, venue: @report.venue }
    assert_redirected_to report_path(assigns(:report))
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to reports_path
  end
end
