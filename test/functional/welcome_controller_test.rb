require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  setup do
    #if market_dreams_is_soon
    @stage = create :stage
    @stage.title = I18n.t 'stages.market_dreams'
    @stage.save
    #endif
  end
   test "get Index page" do
     @user = create :user
     get :index
     assert_response :success
   end

   test "get competition page" do
     get :competition
     assert_response :success
   end

   test "get first_stage page" do
     get :first_stage
     assert_response :success
   end

   test "get second_stage page" do
     get :second_stage
     assert_response :success
   end

   test "get third_stage page" do
     get :third_stage
     assert_response :success
   end

   test "should get reg_end" do
     get :reg_end
     assert_response :redirect
   end
end
