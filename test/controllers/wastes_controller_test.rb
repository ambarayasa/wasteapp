require "test_helper"

class WastesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wastes_index_url
    assert_response :success
  end

  test "should get new" do
    get wastes_new_url
    assert_response :success
  end

  test "should get edit" do
    get wastes_edit_url
    assert_response :success
  end

  test "should get show" do
    get wastes_show_url
    assert_response :success
  end
end
