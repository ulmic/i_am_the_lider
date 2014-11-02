require 'test_helper'

class Admin::ParticipantsControllerTest < ActionController::TestCase
  setup do
    @participant = create :event_participant
    @admin = create :admin
    @report = create :event_report
    event = create :event
    @report.event = event
    @report.save
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

  test "should create participant" do
    attributes = attributes_for :event_participant
    post :create, event_participant: attributes
    assert_response :redirect

    participant = Event::Participant.last
    assert_equal attributes[:full_name], participant.full_name
  end

  test "should not create participant" do
    attributes = { full_name: @participant.full_name }

    post :create, participant: attributes
    assert_response :success
  end

  test "should destroy participant" do
    event = @participant.report.event
    assert_difference('Event::Participant.count', -1) do
      delete :destroy, id: @participant
    end

    assert_redirected_to admin_event_path event
  end
end
