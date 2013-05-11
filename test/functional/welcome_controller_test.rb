require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
   test "get Index page" do
     get :index
     assert_response :success
   end
end
