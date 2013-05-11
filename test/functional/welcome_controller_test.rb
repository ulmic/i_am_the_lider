require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
   test "get Index page" do
     get :index
     assert_response :success
   end

   test "get competition page" do
     get :competition
     assert_response :success
   end

end
