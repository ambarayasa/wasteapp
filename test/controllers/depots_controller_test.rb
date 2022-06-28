require "test_helper"

class DepotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get depots_index_url
    assert_response :success
  end

  test "should get new" do
    get depots_new_url
    assert_response :success
  end

  test "should get edit" do
    get depots_edit_url
    assert_response :success
  end

  test "should get show" do
    get depots_show_url
    assert_response :success
  end
end
