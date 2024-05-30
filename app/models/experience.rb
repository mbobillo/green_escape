class Experience < ApplicationRecord
  has_many :bookings
  has_many :accommodations, through: :bookings
end
