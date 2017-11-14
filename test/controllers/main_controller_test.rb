require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get error" do
    get main_error_url
    assert_response :success
  end

end
