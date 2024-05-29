class Booking < ApplicationRecord
  belongs_to :accomodation
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
