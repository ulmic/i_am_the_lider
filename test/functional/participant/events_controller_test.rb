require 'test_helper'

class Participant::EventsControllerTest < ActionController::TestCase
  setup do
    @event = create :event
    @user = create :user
    user_sign_in @user
  end

  test "should get new" do
    get :new, id: @user
    assert_response :success
  end

  test "should create event" do
    attributes = attributes_for :event

    post :create, event: attributes, id: @user
    assert_response :redirect

    event = Event.last
    assert_equal attributes[:title], event.title
  end

  test "should not create event" do
    attributes = { title: @event.title, description: @event.description }

    post :create, event: attributes, id: @user
    assert_response :success
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit by user" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event by user" do
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
    user = @event.user
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to participant_welcome_index_path(user)
  end
end
