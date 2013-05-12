require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
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
    user_sign_in @user
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
    @admin = Admin.first
    admin_sign_in(@admin)

    get :edit, id: @report
    assert_response :success
  end

  test "should update report" do
    @admin = Admin.first
    admin_sign_in(@admin)    

    attributes = attributes_for :report
    put :update, id: @report, report: attributes
    assert_response :redirect

    @report.reload
    assert_equal attributes[:description], @report.description
  end

  test "should destroy report" do
    @admin = Admin.first
    admin_sign_in(@admin)
    
    assert_difference('Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to reports_path
  end
end
