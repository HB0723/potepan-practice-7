require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in users(:one)

    get rooms_url
    assert_response :success
  end

  test "should get show" do
    get room_url(rooms(:one))
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)

    get new_room_url
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)

    get edit_room_url(rooms(:one))
    assert_response :success
  end
end
