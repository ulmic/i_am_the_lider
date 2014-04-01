require 'test_helper'

class Participant::Event::ParticipantsControllerTest < ActionController::TestCase
  setup do
    @participant = create :event_participant
    @user = create :user
    @report = create :event_report
    @event = create :event
    @report.event_id = @event.id
    @report.save
    user_sign_in @user
  end

  test "should get new" do
    get :new, id: @event
    assert_response :success
  end

  test "should create participant" do
    attributes = attributes_for :event_participant

    post :create, event_participant: attributes, id: @event
    assert_response :redirect

    participant = Event::Participant.last
    assert_equal attributes[:full_name], participant.full_name
  end

  test "should not create participant" do
    attributes = { full_name: @participant.full_name }

    post :create, event_participant: attributes, id: @report
    assert_response :success
  end

  test "should get edit by user" do
    get :edit, id: @participant
    assert_response :success
  end

  test "should update participant" do
    attributes = attributes_for :event_participant
    put :update, id: @participant, event_participant: attributes
    assert_response :redirect

    @participant.reload
    assert_equal attributes[:full_name], @participant.full_name
  end

  test "should not update participant with render edit" do
    attributes = attributes_for :event_participant
    attributes[:full_name] = nil
    put :update, id: @participant, event_participant: attributes

    assert_response :success

    assert_template :edit
  end

  test "should destroy participant" do
    event = @participant.report.event
    assert_difference('Event::Participant.count', -1) do
      delete :destroy, id: @participant
    end

    assert_redirected_to participant_event_path(event)
  end
end
