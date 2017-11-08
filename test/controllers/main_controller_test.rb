require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get default" do
    get main_default_url
    assert_response :success
  end

end
