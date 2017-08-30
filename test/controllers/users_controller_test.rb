require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get '/signup'
    assert_response :success
    assert_select "title", "Sign up"
  end

end
