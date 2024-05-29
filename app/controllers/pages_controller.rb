class PagesController < ApplicationController
  def home
    @accomodations = Accomodation
    .left_joins(:bookings)
    .group('accomodations.id')
    .order('COUNT(bookings.id) DESC')
    .select('accomodations.*, COUNT(bookings.id) as bookings_count')
  end
end
