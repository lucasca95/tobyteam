require 'test_helper'

class BugControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get bug_show_url
    assert_response :success
  end

end
