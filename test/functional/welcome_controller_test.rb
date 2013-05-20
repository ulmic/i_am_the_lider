require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
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
end
