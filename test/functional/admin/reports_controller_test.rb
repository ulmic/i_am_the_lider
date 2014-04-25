require 'test_helper'

class Admin::ReportsControllerTest < ActionController::TestCase
  setup do
    @report = create :event_report
    @admin = create :admin
    @event = create :event
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

  test "should create report" do
    attributes = attributes_for :event_report
    attributes[:event_id] = @event.id

    post :create, event_report: attributes
    assert_response :redirect

    report = Event::Report.last
    assert_equal attributes[:description], report.description
  end

  test "should not create report" do
    attributes = { description: @report.description }

    post :create, report: attributes
    assert_response :success
  end

  test "should get edit by admin" do
    get :edit, id: @report
    assert_response :success
  end

  test "should update report by admin" do
    attributes = attributes_for :event_report
    put :update, id: @report, report: attributes
    assert_response :redirect

    @report.reload
    assert_equal attributes[:description], @report.description
  end

  test "should not update report with render edit" do
    attributes = attributes_for :event_report
    attributes[:description] = nil
    put :update, id: @report, report: attributes

    assert_response :success

    assert_template :edit
  end

  test "should destroy report" do
    assert_difference('Event::Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to admin_reports_path
  end
end
