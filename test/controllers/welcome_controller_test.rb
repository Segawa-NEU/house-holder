require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test '/welcome should get welcome page' do
    get welcome_path
    assert_response :success
    assert_select 'title', "Welcome"
  end

  test 'root should redirect to welcome page' do
    get '/'
    assert_response :redirect
    assert_redirected_to '/welcome'
  end

end
