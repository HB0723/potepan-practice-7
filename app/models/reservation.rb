class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :checkin_at, :checkout_at, :guest_count, presence: true

  validates :checkin_at,
            comparison: {
              greater_than_or_equal_to: -> { Date.current }
            },
            allow_nil: true

  validates :checkout_at,
            comparison: {
              greater_than: :checkin_at
            },
            allow_nil: true

  validates :guest_count,
            numericality: {
              greater_than_or_equal_to: 1
            },
            allow_nil: true
end
