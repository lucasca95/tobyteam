require 'test_helper'

class LevelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get levels_new_url
    assert_response :success
  end

  test "should get edit" do
    get levels_edit_url
    assert_response :success
  end

  test "should get show" do
    get levels_show_url
    assert_response :success
  end

  test "should get index" do
    get levels_index_url
    assert_response :success
  end

  test "should get create" do
    get levels_create_url
    assert_response :success
  end

  test "should get update" do
    get levels_update_url
    assert_response :success
  end

  test "should get destroy" do
    get levels_destroy_url
    assert_response :success
  end

end
