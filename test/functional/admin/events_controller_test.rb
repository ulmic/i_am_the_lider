require 'test_helper'

class Admin::EventsControllerTest < ActionController::TestCase
  setup do
    @event = create :event
    @user = create :user
    @admin = create :admin
    admin_sign_in @admin
  end

  test "should get new" do
    get :new, id: @admin
    assert_response :success
  end

  test "should create event" do
    attributes = attributes_for :event
    attributes[:user_id] = @user.id

    post :create, event: attributes, id: @user
    assert_response :redirect

    event = Event.last
    assert_equal attributes[:title], event.title
  end

  test "should not create event" do
    attributes = { title: @event.title, description: @event.description }

    post :create, event: attributes, id: @admin
    assert_response :success
  end

  test "should show event" do
    @event.report = create :event_report
    @event.report.participants.build attributes_for :event_participant
    get :show, id: @event
    assert_response :success
  end

  test "should get edit by admin" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event by admin" do
    attributes = attributes_for :event
    put :update, id: @event, event: attributes
    assert_response :redirect

    @event.reload
    assert_equal attributes[:title], @event.title
  end

  test "should not update event with render edit" do
    attributes = attributes_for :event
    attributes[:title] = nil
    put :update, id: @event, event: attributes

    assert_response :success

    assert_template :edit
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to admin_welcome_index_path
  end
end
