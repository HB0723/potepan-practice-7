require "test_helper"

class Users::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    sign_in users(:one)

    get users_profiles_edit_url
    assert_response :success
  end
end
