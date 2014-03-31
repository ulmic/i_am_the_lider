require 'test_helper'

class Participant::Event::ReportsControllerTest < ActionController::TestCase
  setup do
    @report = create :event_report
    @user = create :user
    @event = create :event
    user_sign_in @user
  end

  test "should get new" do
    get :new, id: @event
    assert_response :success
  end

  test "should create report" do
    attributes = attributes_for :event_report

    post :create, report: attributes, id: @event
    assert_response :redirect

    report = Event::Report.last
    assert_equal attributes[:description], report.description
  end

  test "should not create report" do
    attributes = { description: @report.description }

    post :create, report: attributes, id: @event
    assert_response :success
  end

  test "should show report" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit by user" do
    get :edit, id: @report
    assert_response :success
  end

  test "should update report by user" do
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
    user = @report.event.user
    assert_difference('Event::Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to participant_welcome_index_path(user)
  end
end
