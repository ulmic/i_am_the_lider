require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
   test "get 404 page" do
     get :not_found
     assert_response :success
   end
end
