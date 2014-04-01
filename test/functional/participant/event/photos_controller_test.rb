require 'test_helper'

class Participant::Event::PhotosControllerTest < ActionController::TestCase
  setup do
    @photo = create :event_photo
    @user = create :user
    @report = create :event_report
    event = create :event
    @report.event = event
    @report.save
    user_sign_in @user
  end

  test "should get new" do
    get :new, id: @report
    assert_response :success
  end

  test "should create photo" do
    attributes = attributes_for :event_photo

    post :create, event_photo: attributes, id: @report
    assert_response :redirect

    photo = Event::Photo.last
    assert_equal attributes[:report_id], photo.report_id
  end

  test "should not create photo" do
    attributes = { report_id: @photo.report_id }

    post :create, event_photo: attributes, id: @report
    assert_response :success
  end

  test "should destroy photo" do
    event = @photo.report.event
    assert_difference('Event::Photo.count', -1) do
      delete :destroy, id: @photo
    end

    assert_redirected_to participant_event_path(event)
  end

end
