require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @report = create :report
    @admin = create :admin
  end

  test "should get new" do
    user_sign_in(@user)

    get :new
    assert_response :success
  end

  test "should get edit report by admin" do
    admin_sign_in @admin

    get :edit, id: @report
    assert_response :success
  end

  test "should get edit report by user" do
    @user.id = @report.user_id
    user_sign_in @user

    get :edit, id: @report
    assert_response :success
  end

  test "should create report" do
    user_sign_in @user

    attributes = attributes_for :report
    post :create, report: attributes
    assert_response :redirect

    @report = Report.last
    assert_equal attributes[:description], @report.description
  end

  test "should update report by admin" do
    admin_sign_in @admin

    attributes = attributes_for :report
    put :update, id: @report, report: attributes
    assert_response :redirect

    @report.reload
    assert_equal attributes[:description], @report.description
  end

  test "should update report" do
    @user.id = @report.user_id
    user_sign_in @user

    attributes = attributes_for :report
    put :update, id: @report, report: attributes
    assert_response :redirect

    @report.reload
    assert_equal attributes[:description], @report.description
  end

  test "should destroy report" do
    @user.id = @report.user_id
    user_sign_in @user

    assert_difference('Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to reports_path
  end

  test "should not edit report with no access" do
    get :edit, id: @report
    assert_redirected_to :root
  end

  test "should not create report with render new" do
    user_sign_in @user
    attributes = attributes_for :report
    attributes[:venue] = nil

    post :create, report: attributes
    assert_template :new
  end

  test "should not update report with no access" do
    attributes = attributes_for :report
    put :update, id: @report, report: attributes

    assert_redirected_to @report.user
  end

  test "should get_viewed_user_id" do
    admin_sign_in @admin
    set_viewed_user @user

    attributes = attributes_for :report
    post :create, report: attributes
    assert_response :redirect

    @report = Report.last
    assert_equal attributes[:description], @report.description

    assert_equal @user.id, @report.user_id
  end

#  test "should not update report with render edit" do
#    attributes = attributes_for :report
#    attributes[:venue] = nil
#    put :update, id: @report, report: attributes
#    assert_template /edit/
#  end
end
