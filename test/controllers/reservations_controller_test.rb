require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    sign_in users(:one)

    get new_reservation_url, params: { room_id: rooms(:one).id }

    assert_response :success
  end

  test "should get confirm" do
    sign_in users(:one)

    post reservations_confirm_url, params: {
      room_id: rooms(:one).id,
      reservation: {
        checkin_at: Date.current,
        checkout_at: Date.current + 1.day,
        guest_count: 1
      }
    }

    assert_response :success
  end
end
