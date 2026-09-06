class User < ApplicationRecord
  has_one_attached :icon
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
