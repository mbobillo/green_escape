class Accomodation < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :price, presence: true, numericality: { only_float: true }
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :localisation, presence: true
  geocoded_by :localisation
  after_validation :geocode, if: :will_save_change_to_localisation?
end
