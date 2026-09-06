require "test_helper"

class Users::AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_account_show_url
    assert_response :success
  end
end
