require "test_helper"

class Users::AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    sign_in users(:one)

    get users_account_url
    assert_response :success
  end
end
