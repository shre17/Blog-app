require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get demo" do
    get welcome_demo_url
    assert_response :success
  end

end
